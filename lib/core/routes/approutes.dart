import 'package:get/get.dart';
import 'package:shoppe/features/auth/Screens/home/welcome_screen.dart';
import 'package:shoppe/features/auth/Screens/login/login.dart';
import 'package:shoppe/features/auth/Screens/login/passwordpage.dart';
import 'package:shoppe/features/auth/Screens/login/verification.dart';
import 'package:shoppe/features/auth/Screens/onboarding/onboarding1.dart';
import 'package:shoppe/features/auth/Screens/onboarding/signup.dart';
import 'package:shoppe/features/auth/Screens/recovery/coderecovery.dart';
import 'package:shoppe/features/auth/Screens/recovery/forgotpassword.dart';
import 'package:shoppe/features/auth/Screens/recovery/newpasswordscreen.dart';


class AppRoutes {
  // This class is not meant to be instantiated
  AppRoutes._();

  // --- Route Names ---
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome'; // Add new route name
  static const String createAccount = '/create-account';
  static const String login = '/login';
  static const String verification = '/verification';
  static const String password = '/password';
  static const String passwordRecovery = '/password-recovery';
  static const String passwordRecoveryCode = '/password-recovery-code';
  static const String newPassword = '/new-password';
  static const String home = '/home'; // Add home route for navigation


  // --- Route Pages ---
  static final List<GetPage> pages = [
    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
    ),
     GetPage(
      name: welcome, // Add the new page
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: createAccount,
      page: () => const CreateAccountScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: verification,
      page: () => const VerificationScreen(),
    ),
    GetPage(
      name: password,
      page: () => const PasswordScreen(),
    ),
    GetPage(
      name: passwordRecovery,
      page: () => const PasswordRecoveryScreen(),
    ),
    GetPage(
      name: passwordRecoveryCode,
      page: () => const PasswordRecoveryCodeScreen(),
    ),
    GetPage(
      name: newPassword,
      page: () => const NewPasswordScreen(),
    ),
  ];
}
