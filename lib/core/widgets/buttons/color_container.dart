import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  final String text;
  const ColorContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return  Container(
      margin:EdgeInsets.symmetric(horizontal: 8),
      padding:EdgeInsets.symmetric(horizontal: 8,vertical: 2),
      decoration: BoxDecoration(

          borderRadius:   BorderRadius.circular(5),
          border: Border.all(),
          color: Colors.grey
      ),

      child: Text(text,
        style: TextStyle(
          color:isDarkTheme?Colors.white: Colors.black,

        ),),
    );
  }
}
