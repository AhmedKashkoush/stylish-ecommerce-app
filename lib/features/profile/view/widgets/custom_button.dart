import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.buttonSize,
  });

  final double? buttonSize;
  final String textButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 52),
        backgroundColor: const Color(0xffF83758),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        textButton,
        style:  TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
