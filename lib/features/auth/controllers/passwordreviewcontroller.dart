import 'package:get/get.dart';
import 'package:shoppe/core/routes/approutes.dart';

// Enum to represent the recovery options
enum RecoveryOption { sms, email }

class PasswordRecoveryController extends GetxController {
  // Observable to hold the currently selected recovery option
  final selectedOption = RecoveryOption.sms.obs;

  /// Sets the selected recovery option.
  void selectOption(RecoveryOption option) {
    selectedOption.value = option;
  }

  /// Proceeds to the next step of the recovery process.
  void proceedToNextStep() {
    final option = selectedOption.value == RecoveryOption.sms ? 'SMS' : 'Email';
    print('Proceeding with password recovery via $option');
    // Here you would navigate to the next screen,
    // e.g., an OTP screen for SMS or a confirmation screen for Email.
    Get.toNamed(AppRoutes.passwordRecoveryCode);
  }
}
