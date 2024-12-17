import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/styles.dart';
import '../../widgets/pagination_indicator.dart';
import '../../controllers/on_boarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final obController = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: obController.controller,
              onPageChanged: obController.onPageChangedCallback,
              children: obController.pages
            ),
          ),
          // Pagination indicators
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: PaginationIndicator(currentIndex: obController.currentPage.value, itemCount: 3, activeColor: primary,)),
            
                  obController.currentPage.value == 2 ? const SizedBox.shrink() : TextButton(
                    onPressed: obController.getStarted,
                    style: secondaryTextButtonStyle,
                    child: const Text('Skip'),
                  ),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: obController.animateToNextPage,
                    child: AnimatedContainer(
                      width: obController.currentPage.value == 2 ? 120 : 80,
                      height: 45,
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text(obController.currentPage.value == 2 ? 'Get Started' : 'Next', style: const TextStyle(color: Colors.white),)),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}


