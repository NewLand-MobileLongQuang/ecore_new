
import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/text_styles.dart';

class ITextField extends StatelessWidget {
  const ITextField(
      { this.controller,
        this.filled = false,
        this.obscureText = false,
        this.readOnly = false,
        this.overrideValidator = false,
        super.key,
        this.validator,
        this.fillColor,
        this.suffixIcon,
        this.hintText,
        this.label,
        this.keyboardType,
        this.hintStyle,
        this.labelStyle,
        this.maxLines,
        this.maxLength,
        this.colorBorder,
        this.onChanged,
        this.onSubmitted,
        this.textInputAction
      });
  final String? Function(String?)? validator;

  final TextEditingController? controller;

  final bool filled;
  final Color? fillColor;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? hintText;
  final String? label;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final int? maxLines;
  final int? maxLength;
  final Color? colorBorder;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.textStyleInterW400S14Black,
      controller: controller,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      textInputAction: textInputAction,
      validator: overrideValidator
          ? validator
          : (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        }
        return validator?.call(value);
      },
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: colorBorder ?? Colors.grey),
          ),
          focusedBorder: readOnly == false
            ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ): OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          filled: filled,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          fillColor: fillColor,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: hintStyle?? AppTextStyles.textStyleInterW400S16Grey,
          labelStyle: hintStyle?? AppTextStyles.textStyleInterW400S16Black,
      ),
    );
  }
}
