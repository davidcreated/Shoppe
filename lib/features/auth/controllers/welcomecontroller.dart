import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/routes/approutes.dart';


class WelcomeController extends GetxController {
  // Controller to manage the PageView
  final pageController = PageController();

  // Observable to track the current page index
  final currentPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen for page changes to update the indicator
    pageController.addListener(() {
      if (pageController.page != null) {
        currentPageIndex.value = pageController.page!.round();
      }
    });
  }

  /// Navigates to the home screen.
  void navigateToHome() {
    // Use offAllNamed to clear the navigation stack, so the user
    // can't go back to the onboarding/auth flow.
    Get.offAllNamed(AppRoutes.profilepage);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
