import '../../../core/constants/images.dart';
import '../../../core/constants/strings.dart';

class OnBoardingModel {
  String image;
  String title;
  String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: AppImages.onBoarding1,
    title: AppStrings.onBoarding1Title,
    description: AppStrings.onBoarding1Paragraph,
  ),
  OnBoardingModel(
    image: AppImages.onBoarding2,
    title: AppStrings.onBoarding2Title,
    description: AppStrings.onBoarding2Paragraph,
  ),
  OnBoardingModel(
    image: AppImages.onBoarding3,
    title: AppStrings.onBoarding3Title,
    description: AppStrings.onBoarding3Paragraph,
  ),
];
