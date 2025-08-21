// Custom widget for the recovery option tiles

import 'package:flutter/material.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';
class RecoveryOptionTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const RecoveryOptionTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.subheading.copyWith(color: AppColors.darkGrey)),
            // Custom Radio Button UI
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.lightGrey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
