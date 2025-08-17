import 'package:get/get.dart';
import 'package:shoppe/features/auth/Screens/login/login.dart' show LoginScreen;
import 'package:shoppe/features/auth/Screens/login/passwordpage.dart';
import 'package:shoppe/features/auth/Screens/login/verification.dart';
import '../../features/auth/Screens/onboarding/onboarding1.dart' show OnboardingScreen;
import '../../features/auth/Screens/onboarding/signup.dart';

class AppRoutes {
  // This class is not meant to be instantiated
  AppRoutes._();

  // --- Route Names ---
  static const String onboarding = '/onboarding';
  static const String createAccount = '/create-account';
  static const String login = '/login';
  static const String verification = '/verification';
  static const String password = '/password'; // Add new route name
  // static const String home = '/home';


  // --- Route Pages ---
  static final List<GetPage> pages = [
    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
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
      name: password, // Add the new page
      page: () => const PasswordScreen(),
    ),
  ];
}
