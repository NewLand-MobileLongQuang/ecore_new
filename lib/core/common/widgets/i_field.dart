import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class IField extends StatelessWidget {
  const IField(
      {required this.controller,
      this.filled = false,
      this.obscureText = false,
      this.readOnly = false,
      this.overrideValidator = false,
      super.key,
      this.validator,
      this.fillColor,
      this.suffixIcon,
      this.hintText,
      this.keyboardType,
      this.hintStyle});
  final String? Function(String?)? validator;

  final TextEditingController controller;

  final bool filled;
  final Color? fillColor;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: context.theme.primaryColor)),
        filled: filled,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)
      ),

    );
  }
}
