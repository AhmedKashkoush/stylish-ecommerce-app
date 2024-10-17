import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalOrder extends StatelessWidget {
  const TotalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:17.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Total',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'EGP 7,000.00',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
           SizedBox(
            height:10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'EMI Available',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
               SizedBox(
                width:15.w,
              ),
              Text(
                'Details',
                style: TextStyle(
                  fontSize: 12.sp,
                  color:
                      isDarkTheme ? Colors.redAccent : const Color(0xffF83758),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
