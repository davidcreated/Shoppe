// Custom Chip for Order Status
import 'package:flutter/material.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';

class OrderStatusChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool showIndicator;
  final VoidCallback onTap;

  const OrderStatusChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.showIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
            ),
            child: Text(
              label,
              style: AppTextStyles.bodyText.copyWith(
                color: isSelected ? AppColors.primary : AppColors.darkGrey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          if (showIndicator)
            Positioned(
              top: -2.5,
              right: -2.5,
              child: Container(
                width: 11,
                height: 11,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
