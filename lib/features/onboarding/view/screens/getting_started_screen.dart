import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 240,
                    child: Text(
                      AppStrings.getStartedTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.backgroundLight,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    AppStrings.getStartedParagraph,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.backgroundLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.onboarding);
                    },
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          AppStrings.getStarted,
                          style: TextStyle(
                            color: AppColors.backgroundLight,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
