import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/bank_details.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/custom_button.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/business_details.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/personal_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController ifscController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bankAccountController = TextEditingController();
  final TextEditingController accountHolderController = TextEditingController();

  void _validateForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('field submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This is required')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            color: isDarkTheme ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: isDarkTheme ? Colors.black : Colors.white,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            children: [
              PersonalDetails(
                emailController: emailController,
              ),
              BusinessDetails(
                cityController: cityController,
                stateController: stateController,
                countryController: countryController,
                pincodeController: pincodeController,
                addressController: addressController,
              ),
              BankDetails(
                bankAccountController: bankAccountController,
                accountHolderController: accountHolderController,
                ifscController: ifscController,
              ),
              CustomButton(
                textButton: 'Save',
                onPressed: () {
                  _validateForm(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
