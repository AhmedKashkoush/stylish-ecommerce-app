import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/constants/strings.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

import '../../../../core/constants/colors.dart';
import '../../model/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${currentIndex + 1}",
                        style: const TextStyle(
                          color: AppColors.backgroundDark,
                          height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "/${onBoardingList.length}",
                        style: const TextStyle(
                          color: AppColors.grey,
                          height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  if (currentIndex < onBoardingList.length - 1)
                    InkWell(
                      onTap: () => _goToSignIn(context),
                      child: const Text(
                        AppStrings.skip,
                        style: TextStyle(
                          color: AppColors.backgroundDark,
                          height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    currentIndex = index;
                    setState(() {});
                  },
                  itemCount: onBoardingList.length,
                  itemBuilder: (_, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        30.height,
                    
                        Center(
                          child: SizedBox(
                              height: 300,
                              width: 300,
                              child: Image.asset(onBoardingList[i].image)),
                        ),
                    
                        10.height,
                    
                        Text(
                          onBoardingList[currentIndex].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.backgroundDark,
                            height: 2.5,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          onBoardingList[currentIndex].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.grey,
                            height: 1.5,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        // smooth page indicator
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: currentIndex == 0
                        ? null
                        : () {
                            if (currentIndex == 0) return;
                            currentIndex--;
                            _animateToIndex();
                          },
                    child: Text(
                      AppStrings.prev,
                      style: TextStyle(
                        color: currentIndex == 0
                            ? context.theme.scaffoldBackgroundColor
                            : AppColors.grey,
                        height: 1.5,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                      controller: controller, // PageController
                      count: onBoardingList.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 7,
                        dotWidth: 15,
                        radius: 10,
                        dotColor: AppColors.darkBlue.withOpacity(.2),
                        activeDotColor: AppColors.darkBlue,
                      ), // your preferred effect
                      onDotClicked: (index) {
                        currentIndex = index;
                        _animateToIndex();
                      }),
                  InkWell(
                    onTap: () {
                      if (currentIndex == onBoardingList.length - 1) {
                        _goToSignIn(context);
                        return;
                      }
                      currentIndex++;
                      _animateToIndex();
                    },
                    child: Text(
                      currentIndex < onBoardingList.length - 1
                          ? AppStrings.next
                          : AppStrings.getStarted,
                      style: const TextStyle(
                        color: AppColors.primary,
                        height: 1.5,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animateToIndex() {
    controller.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _goToSignIn(BuildContext context) {
    context.pushReplacementNamed(AppRoutes.signIn);
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == 0
            ? context.theme.textTheme.bodyLarge!.color
            : context.theme.textTheme.bodyLarge!.color!.withOpacity(0.2),
      ),
    );
  }
}
