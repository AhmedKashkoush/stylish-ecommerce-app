import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/list_scroll_button.dart';

class ListScrollBar extends StatefulWidget {
  final PageController controller;
  final int length;
  final VoidCallback? onNext, onPrevious;
  const ListScrollBar({
    super.key,
    required this.controller,
    required this.length,
    this.onNext,
    this.onPrevious,
  });

  @override
  State<ListScrollBar> createState() => _ListScrollBarState();
}

class _ListScrollBarState extends State<ListScrollBar> {
  final ValueNotifier<bool> _hasNextNotifier = ValueNotifier<bool>(true),
      _hasPreviousNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    widget.controller.addListener(_pageListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
            valueListenable: _hasPreviousNotifier,
            builder: (_, hasPrevious, __) {
              if (!hasPrevious) return const SizedBox.shrink();
              return ListScrollButton(
                iconType: ListScrollButtonIconType.previous,
                onTap: widget.onPrevious,
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _hasNextNotifier,
            builder: (_, hasNext, __) {
              if (!hasNext) return const SizedBox.shrink();
              return ListScrollButton(
                iconType: ListScrollButtonIconType.next,
                onTap: widget.onNext,
              );
            },
          ),
        ],
      ),
    );
  }

  void _pageListener() {
    if (!widget.controller.hasClients) return;

    _hasNextNotifier.value = widget.controller.page!.ceil() < widget.length;
    _hasPreviousNotifier.value = widget.controller.page! > 0;
  }
}
