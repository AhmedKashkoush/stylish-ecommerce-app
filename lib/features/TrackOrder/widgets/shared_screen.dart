import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/TrackOrder/widgets/custom_app_bar.dart';

class SharedScreen extends StatelessWidget {
  const SharedScreen({
    super.key,
    required this.text,
    required this.widget1,
  });
  final String text;
  final Widget widget1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: CustomBar(textBar: text),
        ),
        Expanded(
          flex: 8,
          child: widget1,
        ),
      ],
    );
  }
}
