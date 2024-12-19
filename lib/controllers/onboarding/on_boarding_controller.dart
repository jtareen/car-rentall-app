import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/onboarding_model.dart';
import '../../views/login/signin_screen.dart';
import '../../views/onboarding/widgets/onboarding_page_widget.dart';

class OnboardingController extends GetxController{

  final controller = PageController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnboardingPageWidget(
      model: OnboardingModel(
        imagePath: 'assets/images/onboarding_01.jpeg',
        title: 'Endless option',
        description: "Choose from hundreds of models you won't find anywhere else. Pick it up or get it delivered where you want it.",
      ),
    ),
    OnboardingPageWidget(
      model: OnboardingModel(
        imagePath: 'assets/images/onboarding_02.jpeg',
        title: 'Drive confidently',
        description: "Drive confidently with your choice of protection plans. All plans include varying level of insurance from Fakeh insurance",
      ),
    ),
    OnboardingPageWidget(
      model: OnboardingModel(
        imagePath: 'assets/images/onboarding_03.jpeg',
        title: '24/7 Support',
        description: "Rest easy knowing everyone in Pikbil community is screened and support road aside assistant.",
      ),
    ),
  ];

  onPageChangedCallback (int activePageIndex) => currentPage.value = activePageIndex;
  getStarted () => Get.offAll(() => SignInPage());

  void animateToNextPage() {
    if (currentPage.value < 2) {
      controller.animateToPage(
        currentPage.value + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    else {
      getStarted();
    }
  }

}