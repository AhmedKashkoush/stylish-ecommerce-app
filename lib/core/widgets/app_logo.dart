import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/constants/fonts.dart';
import 'package:stylish_ecommerce_app/core/constants/images.dart';
import 'package:stylish_ecommerce_app/core/constants/strings.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';

import '../constants/colors.dart';

class AppLogo extends StatelessWidget {
  final double size, fontSize;
  final bool showText;
  final Color? textColor;
  const AppLogo({
    super.key,
    this.size = 31,
    this.showText = false,
    this.textColor,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.logo,
          height: size,
        ),
        if (showText) ...[
          10.width,
          Text(
            AppStrings.appName,
            style: TextStyle(
              color: textColor ?? AppColors.secondary,
              fontFamily: AppFonts.libreCaslonText,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
      ],
    );
  }
}
