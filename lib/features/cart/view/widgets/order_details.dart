import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:17.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Payment Details',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
           SizedBox(
            height:20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Amounts',
                style: TextStyle(
                  fontSize: 16.sp,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Fee',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
               Text(
                'Free',
                style: TextStyle(
                  fontSize: 14.sp,
 color:
                      isDarkTheme ? Colors.redAccent : const Color(0xffF83758),
                               fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
