import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/TrackOrder/widgets/track_listview.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Delivery Status',
          style: TextStyle(
            fontSize: 18.sp,
            color: isDarkTheme ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(vertical:20.h),
        child: const Column(
          children: [
            TrackListview(),
          ],
        ),
      ),
    );
  }
}
