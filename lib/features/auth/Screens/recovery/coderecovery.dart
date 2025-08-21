import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
import 'package:shoppe/core/routes/approutes.dart';
import 'package:shoppe/features/auth/controllers/passwordrecoverycodeconroller.dart';


class PasswordRecoveryCodeScreen extends StatelessWidget {
  const PasswordRecoveryCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordRecoveryCodeController());

    // Define the style for the PIN input dots
    final defaultPinTheme = PinTheme(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.circle,
      ),
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
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
                    'Enter 4-digits code we sent you\non your phone number',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyText.copyWith(color: AppColors.mediumGrey, height: 1.5),
                  ),
                  const SizedBox(height: 20),

                  // Masked Phone Number
                  Text(
                    '+98********00',
                    style: AppTextStyles.subheading.copyWith(color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 40),

                  // Pinput Field
                  Pinput(
                    length: 4,
                    controller: controller.pinController,
                    focusNode: controller.focusNode,
                    defaultPinTheme: defaultPinTheme,
                    // separator: const SizedBox(width: 16), // Removed as 'separator' is not a valid parameter for Pinput
                    onCompleted: (pin) => controller.verifyCode(pin),
                  ),

                  const Spacer(),

                  // "Send Again" Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(AppRoutes.newPassword);
                        controller.resendCode();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFE7092), // Pink color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text('Send Again', style: AppTextStyles.button),
                    ),
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
