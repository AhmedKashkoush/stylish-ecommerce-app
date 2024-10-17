import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

class SortBottomSheet extends StatelessWidget {
  final List<String> sortOptions;
  final String selected;
  const SortBottomSheet({
    super.key,
    required this.sortOptions,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sort By',
            style: context.theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            itemBuilder: (_, index) => ListTile(
              onTap: () => _onSelect(context, sortOptions[index]),
              selected: sortOptions[index].toLowerCase() == selected,
              selectedColor: Colors.white,
              selectedTileColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              trailing: sortOptions[index].toLowerCase() == selected
                  ? const Icon(Icons.check)
                  : null,
              title: Text(
                sortOptions[index],
                style:  TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(
              thickness: 1,
            ),
            itemCount: sortOptions.length,
          ),
        ],
      ),
    );
  }

  void _onSelect(BuildContext context, String option) {
    context.pop(result: option.toLowerCase());
  }
}
