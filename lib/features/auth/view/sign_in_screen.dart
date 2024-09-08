import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import '../../../config/routes/routes.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 22.0, top: 22, bottom: 18),
            child: Text(
              "Welcome \n Back!",
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
            padding: const EdgeInsets.only(right: 24.0,top: 8,bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.forgotPassword);
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Color(0xffF83758),
                      fontFamily: "Montserrat",
                      fontSize: 12),
                ),
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
                backgroundColor: Color(0xffF83758),
                // Red background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                textStyle: const TextStyle(fontSize: 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Circular border with radius 10
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
                    "Create An Account ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                    child: const Text(
                      "Sign Up ",
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
          )
        ],
      ),
    );
  }


}
