import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
          Center(
              child: CircleAvatar(
                radius: 55.r,
                backgroundImage: const AssetImage('assets/images/avatar.png'),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),    
            Text(
              'Personal Details',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SharedWidget(
                text: 'Email Address', hintText: 'aashifa@gmail.com'),
            const SharedWidget(text: 'Password', hintText: '***********'),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Change Password',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffF83758),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            const Divider(
              thickness: 0.8,
              color: Color(0xffC4C4C4),
            ),
    ],);
  }
}