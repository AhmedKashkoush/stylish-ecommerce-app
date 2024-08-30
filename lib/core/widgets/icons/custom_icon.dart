import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  const CustomIcon({
    super.key,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return HugeIcon(
      color: color ?? context.theme.iconTheme.color!,
      icon: icon,
    );
  }
}
