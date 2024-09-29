import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/google_btn.dart';
import 'package:stylish_ecommerce_app/core/widgets/fields/custom_text_field.dart';
import '../../../../config/routes/routes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 22.0, top: 22, bottom: 18),
            child: Text(
              "Welcome \n Back!",
              style: TextStyle(
                  // fontFamily: "Montserrat",
                  fontSize: 36,
                  //color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child:
              CustomTextField(hintText: 'Username or Email',
                prefixIcon:Icon(Icons.person) ,)
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child:
            CustomTextField(hintText: 'Password',
              prefixIcon:Icon(Icons.lock) ,
              suffixIcon: Icon(Icons.remove_red_eye_outlined),)

          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0, top: 8, bottom: 10),
            child: InkWell(
              onTap: () {
                context.pushNamed(AppRoutes.forgotPassword);
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Color(0xffF83758),
                    // fontFamily: "Montserrat",
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ElevatedButton(
              onPressed: () {
                // Define the button's action here
                context.pushReplacementNamed(AppRoutes.home);
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
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              const Text(
                "- OR Continue with -",
                style: TextStyle(
                   // color: Colors.black,
                    // fontFamily: "Montserrat",
                    fontSize: 14),
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
                  const Text(
                    "Create An Account ",
                    style: TextStyle(
                     //   color: Colors.black,
                        // fontFamily: "Montserrat",
                        fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.signUp);
                    },
                    child: const Text(
                      "Sign Up ",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          // Optional: Set color of the underline
                          decorationThickness: 2.0,
                          color: Color(0xffF83758),
                          // fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
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
}
