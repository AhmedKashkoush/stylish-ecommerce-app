import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/strings.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect rect) => const LinearGradient(
              colors: [
                Color.fromARGB(255, 214, 214, 214),
                Color.fromARGB(255, 48, 48, 48),
              ],
              stops: [0.5, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(rect),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.getStarted),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:50.w, vertical:15.h),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   SizedBox(
                    width:240.w,
                    child: Text(
                      AppStrings.getStartedTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.backgroundLight,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                   SizedBox(
                    height:10.h,
                  ),
                   Text(
                    AppStrings.getStartedParagraph,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.backgroundLight,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300),
                  ),
                   SizedBox(
                    height:30.h,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.onboarding);
                    },
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: double.infinity,
                      height:55.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:  Center(
                        child: Text(
                          AppStrings.getStarted,
                          style: TextStyle(
                            color: AppColors.backgroundLight,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height:15.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
