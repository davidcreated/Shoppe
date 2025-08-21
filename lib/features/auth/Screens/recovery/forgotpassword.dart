import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
import 'package:shoppe/features/auth/controllers/passwordreviewcontroller.dart';
import 'package:shoppe/shared/widgets/buttonwidgets.dart';
import 'package:shoppe/shared/widgets/recoveryoptionwidget.dart';


class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordRecoveryController());

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background decoration
          Positioned(
            bottom: 400,
            left: -120,
            child: Image.asset('assets/images/bubble 04.png', width: MediaQuery.of(context).size.width * 1.3, height: 780),
          ),
           Positioned(
            top: -180,
            right: 30,
            child: Image.asset('assets/images/bubble 03.png', width: MediaQuery.of(context).size.width * 1.5, height: 450),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 110),
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
                  const SizedBox(height: 30),

                  // Title
                  Text(
                    'Password Recovery',
                    style: AppTextStyles.headline2,
                  ),
                  const SizedBox(height: 15),

                  // Subtitle
                  Text(
                    'How would you like to restore\nyour password?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyText.copyWith(color: AppColors.mediumGrey, height: 1.5),
                  ),
                  const SizedBox(height: 50),

                  // Recovery Options
                  Obx(
                    () => Column(
                      children: [
                        RecoveryOptionTile(
                          label: 'SMS',
                          isSelected: controller.selectedOption.value == RecoveryOption.sms,
                          onTap: () => controller.selectOption(RecoveryOption.sms),
                        ),
                        const SizedBox(height: 20),
                        RecoveryOptionTile(
                          label: 'Email',
                          isSelected: controller.selectedOption.value == RecoveryOption.email,
                          onTap: () => controller.selectOption(RecoveryOption.email),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // "Next" Button
                  PrimaryButton(
                    text: 'Next',
                    onPressed: controller.proceedToNextStep,
                  ),
                  const SizedBox(height: 20),

                  // "Cancel" Button
                  Center(
                    child: TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.bodyText.copyWith(color: AppColors.darkGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

