import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/custom_button.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
