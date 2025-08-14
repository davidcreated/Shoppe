import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Text editing controller for the email field
  final emailController = TextEditingController();

  // Global key to manage the form state
  final formKey = GlobalKey<FormState>();

  /// Handles the user login logic.
  void login() {
    // Validate the form
    if (formKey.currentState!.validate()) {
      // If the form is valid, proceed with login.
      // For now, we'll just print the data.
      print('Attempting login with Email: ${emailController.text}');

      // Here you would call your authentication service.
      // e.g., AuthService.instance.loginUser(email);

      // On successful login, navigate to the home screen.
      // Get.offAllNamed(AppRoutes.home);
    }
  }

  @override
  void onClose() {
    // Dispose the controller to free up resources
    emailController.dispose();
    super.onClose();
  }
}
