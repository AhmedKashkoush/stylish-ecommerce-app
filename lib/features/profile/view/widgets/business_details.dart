import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Business Address Details',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SharedWidget(
          text: 'Pincode',
          hintText: '450116',
          keyboardType: TextInputType.number,
        ),
        SharedWidget(
          text: 'Address',
          hintText: '216 St Paul\'s Rd,',
          keyboardType: TextInputType.streetAddress,
        ),
        SharedWidget(
          text: 'City',
          hintText: 'London',
          keyboardType: TextInputType.text,
        ),
        SharedWidget(
          text: 'State',
          hintText: 'N1 2LL',
          keyboardType: TextInputType.text,
        ),
        SharedWidget(
          text: 'Country',
          hintText: 'United Kingdom',
          keyboardType: TextInputType.text,
        ),
        SizedBox(
          height: 25,
        ),
        Divider(
          thickness: 0.8,
          color: Color(0xffC4C4C4),
        ),
      ],
    );
  }
}
