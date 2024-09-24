import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/text_field.dart';

class SharedWidget extends StatelessWidget {
  const SharedWidget({
    super.key,
    required this.text,
    this.textController,
    required this.hintText,
    required this.keyboardType,
  });

  final String text;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        TextForm(
          hintText: hintText,
          labelText: text,
          controller: textController,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
