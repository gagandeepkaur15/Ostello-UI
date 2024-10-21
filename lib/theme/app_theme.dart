import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF7D23E0);
  static const Color bgColor = Colors.white;
  static const blackText = Colors.black;
  static const greyText = Color(0xFF9C9C9C);
  static const errorColor = Color(0xFFE13B30);
  static const Color purple10 = Color.fromARGB(255, 238, 228, 250);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.bgColor,
      indicatorColor: AppColors.errorColor,
      textTheme: TextTheme(
        titleMedium: GoogleFonts.lato(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: AppColors.blackText,
        ),
        bodySmall: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blackText,
        ),
        labelMedium: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        displayMedium: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: AppColors.blackText,
        ),
        displaySmall: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.blackText,
        ),
      ),
    );
  }

  Color get primaryColor => theme.primaryColor;
  Color get backgroundColor => theme.scaffoldBackgroundColor;
}
