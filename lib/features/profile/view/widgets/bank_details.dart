import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/custom_button.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Bank Account Details',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SharedWidget(
          text: 'Bank Account Number',
          hintText: '204356XXXXXXX',
          keyboardType: TextInputType.number,
        ),
        const SharedWidget(
          text: 'Account Holder\'s Name',
          hintText: 'Abhiraj Sisodiya',
          keyboardType: TextInputType.text,
        ),
        const SharedWidget(
          text: 'IFSC Code',
          hintText: 'SBIN00428',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 25,
        ),
        CustomButton(
            textButton: 'Save',
            onPressed: () {
              // Implement save action
            }),
      ],
    );
  }
}
