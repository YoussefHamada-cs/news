import 'package:news/core/resources/app_strings.dart';
import 'package:news/core/resources/constant.dart';
import 'onboarding_item.dart';

class OnboardingData {
  static final List<OnboardingItem> items = [
    OnboardingItem(
      title: AppStrings.onboardingScreenTitle1,
      description: AppStrings.onboardingScreenDescription1,
      image: AppImages.planetEarth,
    ),
    OnboardingItem(
      title: AppStrings.onboardingScreenTitle2,
      description: AppStrings.onboardingScreenDescription2,
      image: AppImages.goal,
    ),
    OnboardingItem(
      title: AppStrings.onboardingScreenTitle3,
      description: AppStrings.onboardingScreenDescription3,
      image: AppImages.smartPhone,
    ),
  ];
}
