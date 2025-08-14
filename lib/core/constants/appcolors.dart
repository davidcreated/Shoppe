import 'package:flutter/material.dart';

/// A class to hold all the color constants for the app.
/// This helps in maintaining a consistent color scheme across the app.
class AppColors {
  // This class is not meant to be instantiated.
  

  // --- Primary Colors ---
  /// The main brand color, a vibrant blue. Used for primary buttons,
  /// links, and important UI elements.
  static const Color primary = Color(0xFF0D47A1); // A deep, strong blue

  /// A lighter shade of the primary color.
  static const Color primaryLight = Color(0xFF1976D2);


  // --- Neutral Colors ---
  /// The darkest color, used for primary headings and essential text.
  static const Color black = Color(0xFF121212);

  /// A dark grey, used for subheadings and body text.
  static const Color darkGrey = Color(0xFF4F4F4F);

  /// A medium grey, often used for less important text or icons.
  static const Color mediumGrey = Color(0xFF828282);

  /// A light grey, typically used for borders, dividers, or disabled states.
  static const Color lightGrey = Color(0xFFBDBDBD);

  /// The color for page backgrounds or cards. A very light off-white.
  static const Color background = Color(0xFFF7F7F7);

  /// Pure white, used for text on dark backgrounds and other elements.
  static const Color white = Color(0xFFFFFFFF);


  // --- Semantic Colors ---
  /// A color to indicate success or a "live" status.
  static const Color success = Color(0xFF27AE60);

  /// A color for warnings or special promotions like sales.
  static const Color warning = Color(0xFFE8950F);

  /// A color to indicate errors or danger.
  static const Color error = Color(0xFFEB5757);
}
