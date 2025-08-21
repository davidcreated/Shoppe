import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
import 'package:shoppe/features/auth/controllers/welcomecontroller.dart';
import 'package:shoppe/shared/widgets/buttonwidgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
class WelcomeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;
  final VoidCallback? onButtonPressed;

  const WelcomeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLastPage = false,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(imagePath, fit: BoxFit.cover, height: 300),
          ),
          const SizedBox(height: 40),
          Text(title, style: AppTextStyles.headline1.copyWith(color: AppColors.white)),
          const SizedBox(height: 15),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText.copyWith(color: AppColors.white.withOpacity(0.8), height: 1.5),
          ),
          const SizedBox(height: 40),
          if (isLastPage)
            PrimaryButton(
              text: "Let's Start",
              onPressed: onButtonPressed ?? () {},
              color: AppColors.white,
              textColor: AppColors.primary,
            ),
        ],
      ),
    );
  }
}
