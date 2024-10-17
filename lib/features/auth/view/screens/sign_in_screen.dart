import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/google_btn.dart';
import 'package:stylish_ecommerce_app/core/widgets/fields/custom_text_field.dart';
import 'package:stylish_ecommerce_app/features/auth/view_model/auth_cubit.dart';
import '../../../../config/routes/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override


  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final isDarkTheme = Theme
    //     .of(context)
    //     .brightness == Brightness.dark;


    return Scaffold(

      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignInSuccess ||state is SignInWithGoogleSuccess) {
            // Navigate to the home screen on successful sign-in
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else if (state is SignInError ) {
            // Show error message on failure
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
          else if(state is SignInWithGoogleError){
            // Show error message on failure
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
                "Welcome \n Back!",
                style: TextStyle(
                  // fontFamily: "Montserrat",
                    fontSize: 36.sp,
                    //color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),


          //  Padding(
          //     padding:  EdgeInsets.all(24.0.r),
          //     child: CustomTextField(
          //       controller: emailController,
          //       hintText: 'Username or Email',
          //       isPssword: false,
          //       prefixIcon: const Icon(Icons.person),
          //     )),
          //  Padding(
          //     padding:  EdgeInsets.symmetric(horizontal:24.w),
          //     child: CustomTextField(
          //       controller: passwordController,
          //       hintText: 'Password',
          //       prefixIcon: const Icon(Icons.lock),
          //      // suffixIcon: Icon(Icons.remove_red_eye_outlined),
          //     )),
          
            Padding(
                padding:  EdgeInsets.all(24.0.r),
                child: CustomTextField(
                  hintText: ' Email',
                  isPssword: false,
                   isVisible: false,
                  controller: emailController,
                  prefixIcon:  Icon(Icons.person , size: 20.sp,),
                )),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:24.w),
                child: CustomTextField(
                  isPssword: true,
                  hintText: 'Password',
                  prefixIcon:  Icon(Icons.lock  , size: 20.sp,),
                //  suffixIcon: const Icon(
                 //   Icons.remove_red_eye_outlined,
                 // ),
                  controller: passwordController,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 8, bottom: 10),
              child: InkWell(
                onTap: () {
                  context.pushNamed(AppRoutes.forgotPassword);
                },
                child:  Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: const Color(0xffF83758),
                      // fontFamily: "Montserrat",
                      fontSize: 12.sp,
                    ),

                  ),
                ),
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(

              builder: (context, state) {
                if (state is SignInLoading) {
                  return const Center(
                      child: CircularProgressIndicator()); // Show a loading indicator during sign-in
                }
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal:18.w),
                  child: ElevatedButton(
                    onPressed: _signIn,
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
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),


           SizedBox(
            height:50.h,
          ),
     
            Column(
              children: [
                 Text(
                  "- OR Continue with -",
                  style: TextStyle(
                    // color: Colors.black,
                    // fontFamily: "Montserrat",
                      fontSize: 14.sp),
                ),
                 SizedBox(
                  height:10.h,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return GoogleBtn(
                      onPressed: context
                          .read<AuthCubit>()
                          .signInWithGoogle,
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
                      "Create An Account ",

                      style: TextStyle(
                        //   color: Colors.black,
                        // fontFamily: "Montserrat",
                          fontSize: 14.sp),
                    ),
                    InkWell(
                      onTap: () {
                        context.pushReplacementNamed(AppRoutes.signUp);
                      },
                      child:  Text(
                        "Sign Up ",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,
                            // Optional: Set color of the underline
                            decorationThickness: 2.0,
                            color: const Color(0xffF83758),
                            // fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp),
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  void _signIn() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in both email and password')),
      );
      return;
    }

    context.read<AuthCubit>().signIn(email, password);
  }
}
