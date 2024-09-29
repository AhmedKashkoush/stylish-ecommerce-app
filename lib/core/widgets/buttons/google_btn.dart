import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return  GoogleAuthButton(
      onPressed: () {},
      text: "Google",

      style:  AuthButtonStyle(
        elevation: 0,
        textStyle: TextStyle(
            color: context.theme.textTheme.bodyLarge!.color,
            fontWeight: FontWeight.bold),
        borderColor: Colors.red,
        // padding: EdgeInsets.zero,
        borderWidth: 1,
        margin: EdgeInsets.zero,
        buttonColor: isDarkTheme? Colors.white:Colors.transparent,
        // padding: EdgeInsets.symmetric(horizontal: 7,),
        buttonType: AuthButtonType.secondary,

        iconType: AuthIconType.secondary,
        borderRadius: 5,
      ),
    );
  }
}
