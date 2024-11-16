import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_test/core/framework/theme/colors/app_colors.dart';

import '../../../../../core/framework/theme/spacing /spacing.dart';

class TextFieldComponent extends StatefulWidget {
  final String? hint;
  final ValueChanged<String>? onChanged;
  final bool headerLess;
  final TextEditingController? textEditingController;
  final int lines;
  final bool readOnly;
  final bool obscureText;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Widget? suffix;
  final TextInputAction textInputAction;
  final Border? border;
  final Color? backgroundColor;
  final String? prefixText;
  final String? headerText;
  final String? Function(String?)? validator;
  final String? header;

  const TextFieldComponent({
    super.key,
    this.hint,
    this.onChanged,
    this.headerText = '',
    this.headerLess = true,
    this.textEditingController,
    this.lines = 1,
    this.readOnly = false,
    this.obscureText = false,
    this.prefix,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.suffix,
    this.textInputAction = TextInputAction.done,
    this.border,
    this.backgroundColor,
    this.prefixText,
    this.validator,
    this.header,
  });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  void initState() {
    _node = widget.focusNode ?? FocusNode();
    super.initState();
  }

  FocusNode? _node;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(
          builder: (context) {
            if (widget.header != null) {
              return Column(
                children: [
                  Text(
                    widget.header!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Spacings.spacing12,
                      color: AppColors.smallTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: Spacings.spacing8,
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          focusNode: _node,
          cursorColor: AppColors.black,
          readOnly: widget.readOnly,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          controller: widget.textEditingController,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.obscureText ? 1 : (widget.lines),
          minLines: widget.obscureText ? 1 : (widget.lines),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.smallTextColor,
            fontSize: Spacings.spacing14,
          ),
          decoration: InputDecoration(
            prefixText: widget.prefixText,
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.smallTextColor,
              fontSize: Spacings.spacing14,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Spacings.spacing12,
              ),
              borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Spacings.spacing12,
              ),
              borderSide: const BorderSide(
                color: AppColors.black,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Spacings.spacing12,
              ),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Spacings.spacing12,
              ),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            border: InputBorder.none,
            suffixIcon: widget.suffix,
            label: Text(
              widget.hint ?? '',
            ),
            labelStyle: const TextStyle(
              color: AppColors.textFieldHint,
              fontWeight: FontWeight.w400,
              fontSize: Spacings.spacing12,
            ),
            hintStyle: const TextStyle(
              color: AppColors.textFieldHint,
              fontWeight: FontWeight.w400,
              fontSize: Spacings.spacing12,
            ),
          ),
        ),
      ],
    );
  }
}
