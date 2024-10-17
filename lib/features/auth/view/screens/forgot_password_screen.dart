import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';

import '../../../../core/widgets/fields/custom_text_field.dart';
import '../../view_model/auth_cubit.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController emailController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,

      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
         if(state is ForgotPasswordSuccess){
           // Show success message and redirect to the sign-in screen
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Password reset email sent.')),
           );
           Navigator.pushReplacementNamed(context, AppRoutes.signIn);
         }
         else if (state is ForgotPasswordError) {
           // Show error message on failure
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text(state.error)),
           );
         }
        },
        child: ListView(
          children: [
             Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 22.0,
                top: 22,
                bottom: 18,
              ),
              child: Text(
                "Forgot \nPassword?",
                style: TextStyle(
                  // fontFamily: "Montserrat",
                  fontSize: 36.sp,
                  //   color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(24.0.r),
              child:
              CustomTextField(
                hintText: "Enter your email address",
                controller: emailController,
                prefixIcon: const Icon(Icons.email),),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal:24.w, vertical:12.h),
              child: Text(
                "We will send you a message to set or reset your new password",
                style: TextStyle(
                  //  color: Colors.grey.shade700,
                  // fontFamily: "Montserrat",
                  fontSize: 12.sp,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal:24.w, vertical:8.h),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is ForgotPasswordLoading) {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return ElevatedButton(
                    onPressed: _resetPassword,
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
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _resetPassword() {
    final email = emailController.text;

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }

    context.read<AuthCubit>().forgotPassword(email);
  }
}
