import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppe/core/constants/appcolors.dart';


class AppTextStyles {
  // This class is not meant to be instantiated.
  AppTextStyles._();

  /// For large, prominent headings like "Create Account".
  /// Font Size: 28, Weight: Bold
  static final TextStyle headline1 = GoogleFonts.openSans(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  /// For screen titles or major section headings like "Hello, Romina!".
  /// Font Size: 24, Weight: Bold
  static final TextStyle headline2 = GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  /// For subheadings like "Recently viewed" or "Categories".
  /// Font Size: 18, Weight: Semi-bold
  static final TextStyle subheading = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColors.darkGrey,
  );

  /// For primary body text and input fields.
  /// Font Size: 16, Weight: Regular
  static final TextStyle bodyText = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  /// For smaller, secondary text like captions or announcements.
  /// Font Size: 14, Weight: Regular
  static final TextStyle caption = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.mediumGrey,
  );

  /// The style for text on primary buttons.
  /// Font Size: 16, Weight: Semi-bold
  static final TextStyle button = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColors.white,
  );
}
