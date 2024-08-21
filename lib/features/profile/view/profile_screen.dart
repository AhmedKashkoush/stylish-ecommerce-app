import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/custom_button.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: ListView(
          children: [
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
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Business Address Details',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SharedWidget(text: 'Pincode', hintText: '450116'),
            const SharedWidget(text: 'Address', hintText: '216 St Paul\'s Rd,'),
            const SharedWidget(text: 'City', hintText: 'London'),
            const SharedWidget(text: 'State', hintText: 'N1 2LL,'),
            const SharedWidget(text: 'Country', hintText: 'United Kingdom'),
            SizedBox(
              height: 25.h,
            ),
            const Divider(
              thickness: 0.8,
              color: Color(0xffC4C4C4),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Bank Account Details',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SharedWidget(
                text: 'Bank Account Number', hintText: '204356XXXXXXX'),
            const SharedWidget(
                text: 'Account Holder\'s Name', hintText: 'Abhiraj Sisodiya'),
            const SharedWidget(text: 'IFSC Code', hintText: 'SBIN00428'),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(textButton: 'Save', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
