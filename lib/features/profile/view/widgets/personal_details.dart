import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/profile_header.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileHeader(),
         SizedBox(height:20.h),
        Text(
          'Personal Details',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        SharedWidget(
          text: 'Email Address',
          hintText: 'aashifa@gmail.com',
          textController: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
         SizedBox(height:10.h),
        Align(
          alignment: Alignment.topRight,
          child: Stack(
            children: [
              Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: isDarkTheme
                      ? const Color.fromARGB(255, 240, 121, 121)
                      : const Color(0xffF83758),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height:1.h,
                  color: isDarkTheme
                      ? const Color.fromARGB(255, 240, 121, 121)
                      : const Color(0xffF83758),
                ),
              ),
            ],
          ),
        ),
         SizedBox(height:25.h),
        Divider(
          thickness: 0.8,
          color: isDarkTheme ? Colors.white54 : const Color(0xffC4C4C4),
        ),
      ],
    );
  }
}
