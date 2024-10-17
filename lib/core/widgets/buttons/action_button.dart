import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final Color? color;
  final void Function()? onPressed;
  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding:  EdgeInsets.all(4.0.r),
        decoration: BoxDecoration(
          color: color ?? context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style:  TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            6.0.width,
            icon,
          ],
        ),
      ),
    );
  }
}
