import 'package:get/get.dart';
import 'package:shoppe/features/auth/Screens/login.dart';
import 'package:shoppe/features/auth/Screens/onboarding1.dart';
import 'package:shoppe/features/auth/Screens/signup.dart';


class AppRoutes {
  // This class is not meant to be instantiated
  AppRoutes._();

  // --- Route Names ---
  static const String onboarding = '/onboarding';
  static const String createAccount = '/create-account';
  static const String login = '/login'; // The route is already here, now we link it
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
      page: () => const LoginScreen(), // Link the route name to the screen
    ),
  ];
}
