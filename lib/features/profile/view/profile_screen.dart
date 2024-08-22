import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/bank_details.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/business_details.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/personal_details.dart';

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
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        children: const [
          PersonalDetails(),
          BusinessDetails(),
          BankDetails(),
        ],
      ),
    );
  }
}
