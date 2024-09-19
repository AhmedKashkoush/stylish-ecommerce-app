import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/action_button.dart';
import 'package:stylish_ecommerce_app/core/widgets/icons/custom_icon.dart';

class ActionBar extends StatelessWidget {
  final VoidCallback onSort, onFilter;
  const ActionBar({
    super.key,
    required this.onSort,
    required this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ActionButton(
          label: 'Sort',
          icon: const CustomIcon(
            icon: HugeIcons.strokeRoundedArrowDataTransferVertical,
            size: 14,
          ),
          onPressed: onSort,
        ),
        10.width,
        ActionButton(
          label: 'Filter',
          icon: const CustomIcon(
            icon: HugeIcons.strokeRoundedFilter,
            size: 14,
          ),
          onPressed: onFilter,
        ),
      ],
    );
  }
}
