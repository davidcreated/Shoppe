import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
import 'package:shoppe/core/routes/approutes.dart';
import 'package:shoppe/shared/widgets/buttonwidgets.dart';
 // Assuming you placed the button here

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to make layout responsive
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer to push content down a bit
              SizedBox(height: screenHeight * 0.28),

              // The shopping bag icon
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/bag.png',
                  height: 60,
                ),
              ),
              const SizedBox(height: 40),

              // "Shoppe" Title
              Text(
                'Shoppe',
                style: AppTextStyles.headline1.copyWith(fontSize: 36),
              ),
              const SizedBox(height: 15),

              // Subtitle Text
              Text(
                'Beautiful eCommerce UI Kit\nfor your online store',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyText.copyWith(
                  color: AppColors.mediumGrey,
                  height: 1.5,
                ),
              ),

              // Spacer to push buttons to the bottom
              const Spacer(),

              // "Let's get started" Button
              PrimaryButton(
                text: "Let's get started",
                onPressed: () {
                  // Navigate to the next screen (e.g., Create Account)
                  Get.toNamed(AppRoutes.createAccount);
                  print("Navigate to create account screen");
                },
              ),
              const SizedBox(height: 20),

              // "I already have an account" Link
              GestureDetector(
                onTap: () {
                  // Navigate to the Login screen
                  Get.toNamed(AppRoutes.login);
                  print("Navigate to login screen");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I already have an account',
                      style: AppTextStyles.bodyText,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF004CFF),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom padding
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
