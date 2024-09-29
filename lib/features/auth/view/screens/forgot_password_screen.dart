import 'package:flutter/material.dart';

import '../../../../core/widgets/fields/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(
              start: 22.0,
              top: 22,
              bottom: 18,
            ),
            child: Text(
              "Forgot \nPassword?",
              style: TextStyle(
                // fontFamily: "Montserrat",
                fontSize: 36,
             //   color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child:
            CustomTextField(hintText: "Enter your email address",
              prefixIcon:Icon(Icons.email) ,),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: Text(
              "We will send you a message to set or reset your new password",
              style: TextStyle(
              //  color: Colors.grey.shade700,
                // fontFamily: "Montserrat",
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                // Define the button's action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF83758),
                // Red background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                textStyle: const TextStyle(fontSize: 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ), // Circular border with radius 10
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildIcon(Widget button) {
  //   return Container(
  //     padding: const EdgeInsets.all(12.0),
  //     decoration: BoxDecoration(
  //       color: const Color(0XFFFCF3F6), // White background color
  //       shape: BoxShape.circle, // Circular shape
  //       border: Border.all(color: Colors.red, width: 2.0), // Red border
  //     ),
  //     child: ClipOval(child: button), // Red icon color
  //   );
  // }
}
