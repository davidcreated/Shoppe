import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';


class PasswordController extends GetxController {
  final passwordController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final String userName = Get.arguments ?? 'User';

  // Observable to track the error state for the UI
  final isPasswordIncorrect = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Add a listener to reset the error state when the user starts typing again
    passwordController.addListener(() {
      if (isPasswordIncorrect.value) {
        isPasswordIncorrect.value = false;
      }
    });
  }

  /// Validates the entered password and proceeds.
  void verifyPassword(String pin) {
    focusNode.unfocus();

    // Example validation
    if (pin != 'password') {
      // Set error state to true to trigger red dots in the UI
      isPasswordIncorrect.value = true;
      // Show the "Forgot Password" snackbar alert
      showForgotPasswordSnackbar();
      // Clear the input field after a short delay to allow the user to see the error
      Future.delayed(const Duration(milliseconds: 800), () {
        passwordController.clear();
        focusNode.requestFocus(); // Bring focus back to the input
      });
    } else {
      // Password is correct
      isPasswordIncorrect.value = false;
      print('Password Correct! Navigating to home...');
      // Navigate to home screen
      // Get.offAllNamed(AppRoutes.home);
    }
  }

  /// Shows a quick snackbar for "Forgot Password".
  void showForgotPasswordSnackbar() {
    Get.snackbar(
      'Incorrect Password',
      'Forgot your password? We can help with that.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.error,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      borderRadius: 12,
    );
  }

  @override
  void onClose() {
    passwordController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
