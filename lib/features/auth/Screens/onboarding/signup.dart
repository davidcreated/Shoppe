import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
import 'package:shoppe/core/routes/approutes.dart';
import 'package:shoppe/features/auth/controllers/createaccount.dart';
import 'package:shoppe/shared/widgets/buttonwidgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final controller = Get.put(CreateAccountController());

    return Scaffold(
      body: Stack(
        children: [
          // Background bubble decorations
          Positioned(
            top: -180,
            right: -120,
            child: Image.asset('assets/images/bubble 01.png', width: 300),
          ),
          Positioned(
            top: 10,
            left: -60,
            child: Image.asset('assets/images/bubble 02.png', width: 300),
          ),
          SafeArea(
            child: SingleChildScrollView(

              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    // "Create Account" Title
                    Text(
                      'Create\nAccount',
                      style: AppTextStyles.headline1.copyWith(fontSize: 40, height: 1.2),
                    ),
                    const SizedBox(height: 40),
                    
                    // Upload Photo Widget (Placeholder)
                    Positioned(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColors.background,
                            ),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.primary,
                              size: 30,
                            ),
                            // Dashed border effect
                            
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

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
)
                    ,
                    const SizedBox(height: 20), // Removed extra comma

                    // Password Text Field
                    Obx(
  () => TextFormField(
    controller: controller.passwordController,
    obscureText: !controller.isPasswordVisible.value,
    decoration: InputDecoration(
      labelText: 'Password',
      filled: true,
      fillColor: const Color(0xFFF8F8F8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(59.29),
        borderSide: BorderSide.none, // removes the default outline
      ),
      suffixIcon: IconButton(
        icon: Icon(
          controller.isPasswordVisible.value
              ? Icons.visibility_off
              : Icons.visibility,
          color: Colors.black,
          size: 20,
        ),
        onPressed: controller.togglePasswordVisibility,
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

                    // Phone Number Field
                  IntlPhoneField(
  controller: controller.phoneController,
  decoration: InputDecoration(
    filled: true,
    fillColor: const Color(0xFFF8F8F8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(59.29),
      borderSide: BorderSide.none,
    ),
  ),
  initialCountryCode: 'GB', // UK as default
  dropdownIconPosition: IconPosition.trailing, // Arrow on the right of flag
  onChanged: (phone) {
    print("Full number: ${phone.completeNumber}"); // +44 123456...
    print("Country code: ${phone.countryCode}");   // +44
    print("Number: ${phone.number}");              // 123456...
  },
  onCountryChanged: (country) { 
    print('Country changed to: ${country.name} (+${country.dialCode})');
  },
),
                    SizedBox(height: 50),

                    // "Done" Button
                    PrimaryButton(
                      text: 'Done',
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
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
                    const SizedBox(height: 40),
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
