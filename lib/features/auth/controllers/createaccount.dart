import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/routes/approutes.dart';

class CreateAccountController extends GetxController {
  // Text editing controllers for the form fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  // Observable boolean to toggle password visibility
  final isPasswordVisible = false.obs;

  // Global key to manage the form state
  final formKey = GlobalKey<FormState>();

  /// Toggles the visibility of the password field.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Handles the account creation logic.
  void createAccount() {
    // Validate the form fields
    if (formKey.currentState!.validate()) {
      // If the form is valid, proceed with account creation logic.
      // For now, we'll just print the data.
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print('Phone: ${phoneController.text}');

      // You would typically call an authentication service here.
      // e.g., AuthService.instance.createUser(email, password);

      // Navigate to the next screen on success
      Get.offAllNamed(AppRoutes.profilepage);
    }
  }

  @override
  void onClose() {
    // Dispose controllers to free up resources
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
