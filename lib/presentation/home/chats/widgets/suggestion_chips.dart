import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionChips extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  bool isSelected;
  SuggestionChips(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: isSelected
                ? null
                : Border.all(color: AppColors.textfieldBorder),
            color: isSelected ? AppColors.green : AppColors.cardFillColors),
        child: Text(
          title,
          style: GoogleFonts.josefinSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isSelected ? AppColors.white : AppColors.black),
        ),
      ),
    );
  }
}
