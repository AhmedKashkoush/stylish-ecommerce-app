
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import '../../../config/routes/routes.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 22.0, top: 22, bottom: 18),
            child: Text(
              "Create an\n Account",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                // Light grey fill color
                prefixIcon: const Icon(Icons.person),
                // Profile icon
                hintText: 'Username or Email',
                // Hint text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded border
                  borderSide: BorderSide.none, // Remove border line
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                // Light grey fill color
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                // Profile icon
                hintText: 'Password',
                // Hint text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded border
                  borderSide: BorderSide.none, // Remove border line
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                // Light grey fill color
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                // Profile icon
                hintText: 'Confirm Password',
                // Hint text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded border
                  borderSide: BorderSide.none, // Remove border line
                ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 24,right: 24,bottom: 24),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By clicking the ",
                    style: TextStyle(
                      color: Colors.grey.shade700
                    ),
                  ),
                  TextSpan(
                    text: "Register ",
                    style: TextStyle(
                        color: Colors.red
                    ),
                  ),
                  TextSpan(
                    text: "button,you agree to the public offer ",
                    style: TextStyle(
                        color: Colors.grey.shade700
                    ),
                  ),
                ]
              )

            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                // Define the button's action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF83758),
                // Red background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                textStyle: TextStyle(fontSize: 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Circular border with radius 10
                ),
              ),
              child: Text(
                'Create Account',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            child: Column(
              children: [
                const Text(
                  "- OR Continue with -",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Montserrat",
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                GoogleAuthButton(
                  onPressed: () {},
                  text: "Google",
                  style:const AuthButtonStyle(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      borderColor: Colors.red,
                      // padding: EdgeInsets.zero,
                      borderWidth: 1,
                      margin: EdgeInsets.zero,
                      buttonColor: Colors.white,
                      // padding: EdgeInsets.symmetric(horizontal: 7,),
                      buttonType: AuthButtonType.secondary,
                      iconType: AuthIconType.secondary,
                      borderRadius: 5
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const  Text(
                      "I Already Have An Account ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signIn);
                      },
                      child: const Text(
                        "Login ",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,
                            // Optional: Set color of the underline
                            decorationThickness: 2.0,
                            color: Color(0xffF83758),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIcon(Widget button) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0XFFFCF3F6), // White background color
        shape: BoxShape.circle, // Circular shape
        border: Border.all(color: Colors.red, width: 2.0), // Red border
      ),
      child: ClipOval(child: button), // Red icon color
    );
  }
}




