import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/google_btn.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/widgets/fields/custom_text_field.dart';
import '../../view_model/auth_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccess || state is SignInWithGoogleSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
          else if (state is SignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
          else if (state is SignInWithGoogleError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: ListView(
          children: [
             Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 22, bottom: 18),
              child: Text(
                "Create an\n Account",
                style: TextStyle(
                  // fontFamily: "Montserrat",
                  fontSize: 36.sp,
                  // color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding:  EdgeInsets.all(24.0.r),
                child: CustomTextField(
                  hintText: ' Email',
                  isVisible: false,
                  prefixIcon: const Icon(Icons.person),
                  controller: emailController,
                )),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:24.w),
                child: CustomTextField(
                  hintText: 'Password',
                  isPssword: true,
                  controller: passwordController,
                  prefixIcon: const Icon(Icons.lock),
                 // suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                )),
            Padding(
                padding:
                 EdgeInsets.symmetric(horizontal:24.w, vertical:24.h),
                child: CustomTextField(
                  isPssword: true,
                  hintText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock),
                 // suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                  controller: confirmPasswordController,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By clicking the ",
                      style: TextStyle(
                        color:
                        isDarkTheme ? Colors.white : Colors.grey.shade700,
                      ),
                    ),
                    const TextSpan(
                      text: "Register ",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(
                      text: "button,you agree to the public offer ",
                      style: TextStyle(
                        color:
                        isDarkTheme ? Colors.white : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding:
               EdgeInsets.symmetric(horizontal:24.w, vertical:8.h),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF83758),
                      // Red background color
                      padding:  EdgeInsets.symmetric(
                          horizontal:24.w, vertical:12.h),
                      textStyle:  TextStyle(fontSize: 22.sp),
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
                  );
                },

              ),
            ),
             SizedBox(
              height:50.h,
            ),
            Column(
              children: [
                Text(
                  "- OR Continue with -",
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey.shade700,
                    // fontFamily: "Montserrat",
                    fontSize: 14.sp,
                  ),
                ),
                 SizedBox(
                  height:10.h,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return  GoogleBtn(
                    onPressed:  context.read<AuthCubit>().signInWithGoogle,
                    );
                  },
                ),
                 SizedBox(
                  height:10.h,
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
                          fontSize: 14.sp),
                    ),
                    InkWell(
                      onTap: () {
                        context.pushReplacementNamed(AppRoutes.signIn);
                      },
                      child:  Text(
                        "Login ",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          // Optional: Set color of the underline
                          decorationThickness: 2.0,
                          color: const Color(0xffF83758),
                          // fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _signUp() {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    context.read<AuthCubit>().signUp(email, password);
  }
}
