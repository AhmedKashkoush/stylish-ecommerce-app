import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({
    super.key,
    required this.ifscController,
    required this.bankAccountController,
    required this.accountHolderController,
  });

  final TextEditingController ifscController;
  final TextEditingController bankAccountController;
  final TextEditingController accountHolderController;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Bank Account Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        SharedWidget(
          text: 'Bank Account Number',
          hintText: '204356XXXXXXX',
          keyboardType: TextInputType.number,
          textController: bankAccountController,
        ),
        SharedWidget(
          text: 'Account Holder\'s Name',
          hintText: 'Abhiraj Sisodiya',
          keyboardType: TextInputType.text,
          textController: accountHolderController,
        ),
        SharedWidget(
          text: 'IFSC Code',
          hintText: 'SBIN00428',
          keyboardType: TextInputType.text,
          textController: ifscController,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
