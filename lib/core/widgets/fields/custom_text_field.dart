import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField(
      {super.key, required this.hintText, required this.prefixIcon, this.suffixIcon});

  @override
  Widget build(BuildContext context) {

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      decoration: InputDecoration(
        filled: true,
         fillColor:isDarkTheme?Colors.white12 :Colors.grey[200],

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // Profile icon
        hintText: hintText,
        // Hint text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded border
          borderSide: BorderSide.none, // Remove border line
        ),
      ),
    );
  }
}
