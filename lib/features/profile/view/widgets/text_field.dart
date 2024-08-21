import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 13.sp,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffC8C8C8),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffC8C8C8),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
