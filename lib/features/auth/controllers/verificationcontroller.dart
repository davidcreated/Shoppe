import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/routes/approutes.dart';

class VerificationController extends GetxController {
  // Controller for the pinput field
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  // Retrieve the user's name passed from the login screen
  final String userName = Get.arguments ?? 'User';

  /// Validates the entered PIN and proceeds.
  void verify() {
    focusNode.unfocus(); // Dismiss the keyboard
    // Validate the form
    if (formKey.currentState!.validate()) {
      print('Entered PIN: ${pinController.text}');
      // Here you would verify the PIN/password with your backend service.
      // If successful, navigate to the home screen.
       Get.offAllNamed(AppRoutes.password);
    }
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
