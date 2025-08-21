import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/routes/approutes.dart';

class PasswordRecoveryCodeController extends GetxController {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  /// Verifies the entered recovery code.
  void verifyCode(String code) {
    focusNode.unfocus();
    print('Verifying recovery code: $code');
    // Here you would validate the code with your backend.
    // If successful, navigate to a "reset password" screen.
     Get.toNamed(AppRoutes.newPassword);
  }

  /// Resends the recovery code.
  void resendCode() {
    print('Resending recovery code...');
    // Add logic to resend the code via your service.
    Get.snackbar(
      'Code Sent',
      'A new recovery code has been sent.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
