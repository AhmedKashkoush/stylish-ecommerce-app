import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
