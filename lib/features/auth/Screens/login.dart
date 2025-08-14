import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
import 'package:shoppe/features/auth/controllers/logincontroller.dart';
import 'package:shoppe/shared/widgets/buttonwidgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final controller = Get.put(LoginController());

    return Scaffold(
      body: Stack(
        children: [
          // Background bubble decorations
          
         
           Positioned(
            bottom: 310,
            left: -160,
            child: Image.asset('assets/images/bubble 04.png', width: 600),
          ),
           Positioned(
            top: -180,
            right: 30,
            child: Image.asset('assets/images/bubble 03.png', width: 500),
          ),
            Positioned(
            bottom: 60,
            right: -120,
            child: Image.asset('assets/images/bubble 05.png', width: 280),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 390),
                    // "Login" Title
                    Text(
                      'Login',
                      style: AppTextStyles.headline1.copyWith(fontSize: 40),
                    ),
                    const SizedBox(height: 10),

                    // Subtitle
                     Row(
                      children: [
                        Text(
                          'Good to see you back!',
                          style: AppTextStyles.bodyText.copyWith(color: AppColors.mediumGrey),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.favorite, color: AppColors.black, size: 18),
                      ],
                    ),
                    const SizedBox(height: 50),

                    // Email Text Field
                    TextFormField(
  controller: controller.emailController,
  decoration: InputDecoration(
    labelText: 'Email',
    filled: true,
    fillColor: Color(0xFFF8F8F8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(59.29),
      borderSide: BorderSide.none, // Removes default border line
    ),
  ),
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || !GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  },
),
                    const SizedBox(height: 50),

                    // "Next" Button
                    PrimaryButton(
                      text: 'Next',
                      onPressed: controller.login,
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
