import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

extension BottomSheetExtension on BuildContext {
  Future<T?> showBottomSheet<T>({
    required Widget content,
    bool isScrollControlled = true,
    bool showDragHandle = true,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: isScrollControlled,
      showDragHandle: showDragHandle,
      backgroundColor: theme.scaffoldBackgroundColor,
      builder: (_) => content,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
      ),
    );
  }
}
