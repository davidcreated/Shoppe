import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
import 'package:shoppe/features/auth/controllers/newpasswordcontroller.dart';
import 'package:shoppe/shared/widgets/buttonwidgets.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewPasswordController());

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: controller.formKey,
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
                      'Setup New Password',
                      style: AppTextStyles.headline2,
                    ),
                    const SizedBox(height: 15),

                    // Subtitle
                    Text(
                      'Please, setup a new password for\nyour account',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyText.copyWith(color: AppColors.mediumGrey, height: 1.5),
                    ),
                    const SizedBox(height: 50),

                    // New Password Field
                    Obx(
                      () => TextFormField(
                        controller: controller.newPasswordController,
                        obscureText: !controller.isNewPasswordVisible.value,
                        decoration: InputDecoration( 
                          filled: true,
      fillColor: const Color(0xFFF8F8F8),
                           border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(59.29),
        borderSide: BorderSide.none, // removes the default outline
      ),
                          labelText: 'New Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isNewPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: controller.toggleNewPasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Repeat Password Field
                    Obx(
                      () => TextFormField(
                        controller: controller.repeatPasswordController,
                        obscureText: !controller.isRepeatPasswordVisible.value,
                        decoration: InputDecoration(
                          filled: true,
      fillColor: const Color(0xFFF8F8F8),
                           border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(59.29),
        borderSide: BorderSide.none, // removes the default outline
      ),
                          labelText: 'Repeat Password',
                           suffixIcon: IconButton(
                            icon: Icon(
                              controller.isRepeatPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: controller.toggleRepeatPasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value != controller.newPasswordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 80),

                    // "Save" Button
                    PrimaryButton(
                      text: 'Save',
                      onPressed: controller.saveNewPassword,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
