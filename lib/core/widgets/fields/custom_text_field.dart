import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Widget prefixIcon;
  //final Widget? suffixIcon;
   final TextEditingController controller;
    bool isPssword;
    bool isVisible;
   CustomTextField(
      {super.key, required this.hintText,
        required this.prefixIcon,
       // this.suffixIcon,
        this.isPssword = false,
        this.isVisible = true,
        required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
       obscureText: widget.isVisible,

      decoration: InputDecoration(

        filled: true,
         fillColor:isDarkTheme?Colors.white12 :Colors.grey[200],

        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPssword? IconButton(
          onPressed: () {
            widget.isVisible= !widget.isVisible;
            setState(() {

            });
          },
          icon: !widget.isVisible?const Icon(Icons.visibility)  : const Icon(Icons.visibility_off),

        ): null,


        // Profile icon
        hintText: widget.hintText,
        // Hint text
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(10.0), // Rounded border
          borderSide: BorderSide.none, // Remove border line
        ),
      ),
      controller:widget.controller ,
    );
  }
}
