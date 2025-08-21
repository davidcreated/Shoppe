import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/routes/approutes.dart';


class PasswordController extends GetxController {
  final passwordController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  // Use a regular String, initialized with a safe default.
  String userName = 'User';

  // Observable to track the error state for the UI
  final isPasswordIncorrect = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Safely assign the userName from arguments after the controller is initialized.
    // This is more robust and prevents null errors during navigation or hot reloads.
    if (Get.arguments != null && Get.arguments is String) {
      userName = Get.arguments;
    }

    // Add a listener to reset the error state when the user starts typing again
    passwordController.addListener(() {
      if (isPasswordIncorrect.value) {
        isPasswordIncorrect.value = false;
      }
    });
  }

  /// Navigates to the home screen after password submission.
  void verifyPassword(String pin) {
    focusNode.unfocus();
    print('Password submitted. Navigating to home...');

    // Navigate to the home screen, clearing the auth flow from the stack.
    Get.offAllNamed(AppRoutes.welcome);
  }

  /// Shows a snackbar with a button to navigate to the recovery screen.
  void showForgotPasswordSnackbar() {
    Get.snackbar(
      'Incorrect Password',
      'Please try again or recover your password.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.error,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
      borderRadius: 12,
      mainButton: TextButton(
        onPressed: () {
          // Navigate to the password recovery screen
          Get.toNamed(AppRoutes.passwordRecovery);
        },
        child: const Text(
          'RECOVER',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  void onClose() {
    passwordController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
