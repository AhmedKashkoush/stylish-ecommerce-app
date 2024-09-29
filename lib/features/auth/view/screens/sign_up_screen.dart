import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/google_btn.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/widgets/fields/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 22.0, top: 22, bottom: 18),
            child: Text(
              "Create an\n Account",
              style: TextStyle(
                // fontFamily: "Montserrat",
                fontSize: 36,
                // color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(24.0),
              child: CustomTextField(
                hintText: 'Username or Email',
                prefixIcon: Icon(Icons.person),
              )),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomTextField(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              )),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
              child: CustomTextField(
                hintText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By clicking the ",
                    style: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                  const TextSpan(
                    text: "Register ",
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: "button,you agree to the public offer ",
                    style: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ],
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
                'Create Account',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text(
                "- OR Continue with -",
                style: TextStyle(
                  color: isDarkTheme ? Colors.white : Colors.grey.shade700,
                  // fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
             GoogleBtn(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I Already Have An Account ",
                    style: TextStyle(
                        color:
                            isDarkTheme ? Colors.white : Colors.grey.shade700,
                        // color: Colors.black,
                        // fontFamily: "Montserrat",
                        fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.signIn);
                    },
                    child: const Text(
                      "Login ",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                        // Optional: Set color of the underline
                        decorationThickness: 2.0,
                        color: Color(0xffF83758),
                        // fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
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
