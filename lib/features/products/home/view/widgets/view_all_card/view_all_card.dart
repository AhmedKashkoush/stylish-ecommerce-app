import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/offer_button.dart';

part 'view_all_card_type.dart';
part 'title_widget.dart';
part 'remaining_time_widget.dart';
part 'last_date_widget.dart';

class ViewAllCard extends StatefulWidget {
  final ViewAllCardType type;
  final DateTime until;
  final VoidCallback onTap;
  const ViewAllCard({
    super.key,
    required this.type,
    required this.until,
    required this.onTap,
  });

  @override
  State<ViewAllCard> createState() => _ViewAllCardState();
}

class _ViewAllCardState extends State<ViewAllCard> {
  Timer? _timer;
  final ValueNotifier<Duration?> _remaining = ValueNotifier<Duration?>(null);

  @override
  void initState() {
    if (widget.type == ViewAllCardType.dealOfTheDay) {
      _timer = Timer.periodic(
        const Duration(milliseconds: 100),
        _countTime,
      );
    }
    super.initState();
  }

  void _countTime(Timer timer) {
    if (widget.until.isAfter(DateTime.now())) {
      _remaining.value = widget.until.difference(DateTime.now());
    } else {
      _remaining.value = null;
      _timer?.cancel();
      _timer = null;
      _remaining.value = null;
      widget.onTap();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.type == ViewAllCardType.dealOfTheDay
            ? AppColors.secondary
            : AppColors.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(type: widget.type),
              5.height,
              widget.type == ViewAllCardType.dealOfTheDay
                  ? RemainingTimeWidget(remaining: _remaining)
                  : LastDateWidget(until: widget.until),
            ],
          ),
          OfferButton(
            text: 'View all',
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}
