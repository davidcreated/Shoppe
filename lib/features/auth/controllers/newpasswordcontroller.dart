import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/routes/approutes.dart';


class NewPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Observables to toggle password visibility
  final isNewPasswordVisible = false.obs;
  final isRepeatPasswordVisible = false.obs;

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleRepeatPasswordVisibility() {
    isRepeatPasswordVisible.value = !isRepeatPasswordVisible.value;
  }

  /// Saves the new password.
  void saveNewPassword() {
    // Validate the form
    if (formKey.currentState!.validate()) {
      print('New password saved: ${newPasswordController.text}');
      // Here you would call your service to update the user's password.

      // On success, show a confirmation and navigate back to the login screen.
      Get.snackbar(
        'Success!',
        'Your password has been updated successfully.',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Navigate to the login screen, clearing the navigation stack.
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }
}
