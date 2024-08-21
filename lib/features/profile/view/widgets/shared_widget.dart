import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(
          height: 20.h,
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
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
