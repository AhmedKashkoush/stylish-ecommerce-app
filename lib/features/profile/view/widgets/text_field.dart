import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid value';
        }
        return null;
      },
      
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffC8C8C8),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffC8C8C8),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
