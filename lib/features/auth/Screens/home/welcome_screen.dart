import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';

import 'package:shoppe/features/auth/controllers/welcomecontroller.dart';

import 'package:shoppe/shared/widgets/welcomecard.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Background decoration
          Positioned(
            top: -100,
            left: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      // First Page: "Hello"
                      const WelcomeCard(
                        imagePath: 'assets/images/Image1.png',
                        title: 'Hello',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
                      ),
                      // Second Page: "Ready?"
                      WelcomeCard(
                        imagePath: 'assets/images/Placeholder_01.png',
                        title: 'Ready?',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        isLastPage: true,
                        onButtonPressed: controller.navigateToHome,
                      ),
                    ],
                  ),
                ),
                // Page Indicator
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      2, // Total number of pages
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 24.0),
                        height: 10,
                        width: controller.currentPageIndex.value == index ? 24 : 10,
                        decoration: BoxDecoration(
                          color: controller.currentPageIndex.value == index
                              ? AppColors.white
                              : AppColors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable card widget for the welcome pages
