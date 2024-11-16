import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:flutter_firebase_test/core/constants/app_textstyles.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  double? width;
  final Color? backgroundColor;
  final double height;
  final String text;

  final Color textColor;
  bool? isValidated;
  final double fontSize;

  final void Function()? onPressed;
  final bool isLoading;

  Duration? animatedDuration;
  PrimaryButton(
      {this.animatedDuration,
      this.onPressed,
      this.isValidated = true,
      this.isLoading = false,
      this.height = 44,
      this.text = '',
      this.textColor = AppColors.white,
      this.width,
      this.fontSize = 16,
      this.backgroundColor = AppColors.green,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: animatedDuration ?? const Duration(milliseconds: 250),
        height: height,
        width: width,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: backgroundColor ?? AppColors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: isLoading
                ? const Center(
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.green,
                      ),
                    ),
                  )
                : Text(text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      textStyle: AppTextStyle.bodyTwo,
                      fontWeight: FontWeight.w300,
                      color: isValidated!
                          ? textColor
                          : AppColors.grey.withOpacity(0.3),
                      fontSize: fontSize,
                    ))));
  }
}
