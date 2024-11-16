import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:flutter_firebase_test/core/constants/app_textstyles.dart';

class AppTextFields extends StatelessWidget {
  final Color? entryBackground;
  //final TextInputType? textInputType;
  final String? errorText;
  void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  List<TextInputFormatter>? inputFormatters;
  int? maxLines, maxLength;
  final Widget? suffWidget;
  final VoidCallback? onTap;
  bool? obscureText;
  final Widget? prefixWidget;
  FocusNode? focusNode;
  final String? hintText;
  bool? enabled, filled;
  AppTextFields(
      {this.controller,
      // this.textInputType,

      this.filled,
      this.onTap,
      this.errorText,
      this.onChanged,
      this.obscureText = false,
      this.suffWidget,
      this.prefixWidget,
      this.entryBackground,
      this.focusNode,
      this.inputFormatters,
      this.hintText,
      this.maxLength,
      this.maxLines,
      this.validator,
      this.onFieldSubmitted,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        cursorColor: AppColors.green,
        onFieldSubmitted: onFieldSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            focusColor: AppColors.textfieldBorder,
            errorText: errorText,
            contentPadding: const EdgeInsets.fromLTRB(12, 11.5, 12, 11.5),
            fillColor: AppColors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    width: 1, color: AppColors.textfieldBorder)),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.textfieldBorder),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.textfieldBorder),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    width: 1, color: AppColors.textfieldBorder)),
            hintText: hintText,
            hintStyle: AppTextStyle.bodyTwo
                .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
            labelStyle: AppTextStyle.bodyThree.copyWith(),
            filled: filled,
            enabled: enabled ?? true,
            prefixIcon: prefixWidget,
            suffixIcon: suffWidget),
        maxLength: maxLength,
        onTap: onTap,
        maxLines: maxLines ?? 1,
        obscureText: obscureText ?? true,
        focusNode: focusNode,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
