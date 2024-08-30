import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: context.theme.scaffoldBackgroundColor.withOpacity(0.2),
      ),
      icon: icon,
    );
  }
}
