import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({super.key, required this.textBar});

  final String textBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
      decoration: const BoxDecoration(
        color: Color(0xffF83758),
      ),
      child: Text(
        textBar,
        style:  TextStyle(
          fontSize: 26.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
