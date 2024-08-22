import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/text_field.dart';

class SharedWidget extends StatelessWidget {
  const SharedWidget({
    super.key,
    required this.text,
    this.textController,
    required this.hintText,
  });

  final String text;
  final String hintText;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextForm(
          controller: textController,
          hintText: hintText,
        ),
      ],
    );
  }
}
