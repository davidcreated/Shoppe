
import 'package:flutter/material.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
import 'package:shoppe/shared/widgets/buttonwidgets.dart';
class WelcomeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;
  final VoidCallback? onButtonPressed;

  const WelcomeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLastPage = false,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(imagePath, fit: BoxFit.cover, height: 300),
          ),
          const SizedBox(height: 40),
          Text(title, style: AppTextStyles.headline1.copyWith(color: AppColors.white)),
          const SizedBox(height: 15),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText.copyWith(color: AppColors.white.withOpacity(0.8), height: 1.5),
          ),
          const SizedBox(height: 40),
          if (isLastPage)
            PrimaryButton(
              text: "Let's Start",
              onPressed: onButtonPressed ?? () {},
              color: AppColors.white,
              textColor: AppColors.primary,
            ),
        ],
      ),
    );
  }
}
