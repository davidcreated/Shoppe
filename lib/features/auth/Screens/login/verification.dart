import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart' show AppTextStyles;
import 'package:shoppe/core/routes/approutes.dart';
import 'package:shoppe/features/auth/controllers/verificationcontroller.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());

    // Define the style for the PIN input boxes
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: AppTextStyles.headline2,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background bubble decoration
        
          Positioned(
            bottom: 400,
            left: -120,
            child: Image.asset('assets/images/bubble 04.png', width: MediaQuery.of(context).size.width * 1.5, height: 450),
          ),
           Positioned(
            top: -180,
            right: 30,
            child: Image.asset('assets/images/bubble 03.png', width: MediaQuery.of(context).size.width * 1.5, height: 450),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 190),

                  // Profile Picture
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                       boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/image.png'),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Greeting Text
                  Text(
                    'Hello, ${controller.userName}!!',
                    style: AppTextStyles.headline2.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 10),

                  // Subtitle
                  Text(
                    'Type your OTP code',
                    style: AppTextStyles.bodyText.copyWith(color: AppColors.mediumGrey),
                  ),
                  const SizedBox(height: 40),

                  // Pinput (OTP/Password) Field
                  Form(
                    key: controller.formKey,
                    child: Pinput(
                      length: 4,
                      controller: controller.pinController,
                      focusNode: controller.focusNode,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: AppColors.primary),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme,
                      validator: (s) {
                        return s == '2222' ? null : 'code is incorrect';
                      },
                      onCompleted: (pin) => controller.verify(),
                    ),
                  ),
                  const SizedBox(height: 100),

                  // "Not you?" Link
                  GestureDetector(
                    onTap: () {
                      // Navigate back to the login screen
                      Get.offAllNamed(AppRoutes.login);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not you?',
                          style: AppTextStyles.bodyText,
                        ),
                        const SizedBox(width: 8),
                        Container(
                           padding: const EdgeInsets.all(6),
                           decoration: const BoxDecoration(
                             color: Color(0xFF004CFF),
                             shape: BoxShape.circle,
                           ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
