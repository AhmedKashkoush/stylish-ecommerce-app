import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/action_button.dart';
import 'package:stylish_ecommerce_app/core/widgets/icons/custom_icon.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/bottom_sheets/filter/filter_options.dart';

class ActionBar extends StatelessWidget {
  final VoidCallback onSort, onFilter;
  final ValueNotifier<FilterOptions> options;
  const ActionBar({
    super.key,
    required this.onSort,
    required this.onFilter,
    required this.options,
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
        ValueListenableBuilder(
          valueListenable: options,
          builder: (_, options, child) {
            return Badge(
              isLabelVisible: options.filters.isNotEmpty,
              backgroundColor: AppColors.primary,
              label: Text(
                '${options.filters.length}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: child!,
            );
          },
          child: ActionButton(
            label: 'Filter',
            icon: const CustomIcon(
              icon: HugeIcons.strokeRoundedFilter,
              size: 14,
            ),
            onPressed: onFilter,
          ),
        ),
      ],
    );
  }
}
