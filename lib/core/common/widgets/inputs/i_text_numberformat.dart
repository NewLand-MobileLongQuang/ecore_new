import 'package:ecore/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../res/text_styles.dart';

class INumberTextField extends StatefulWidget {
  const INumberTextField({
    Key? key,
    this.controller,
    this.filled = false,
    this.obscureText = false,
    this.readOnly = false,
    this.overrideValidator = false,
    this.validator,
    this.fillColor,
    this.suffixIcon,
    this.hintText,
    this.label,
    this.keyboardType,
    this.hintStyle,
    this.labelStyle,
    this.onChanged,
  }) : super(key: key);

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
  final void Function(String)? onChanged; // Thêm tham số onChanged

  @override
  _INumberTextFieldState createState() => _INumberTextFieldState();
}

class _INumberTextFieldState extends State<INumberTextField> {
  late TextEditingController _controller;
  final NumberFormat _numberFormat = NumberFormat("#,##0.00", "en_US");

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_formatInput);
  }

  @override
  void dispose() {
    _controller.removeListener(_formatInput);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _formatInput() {
    String text = _controller.text.replaceAll(',', '');
    if (text.isEmpty) return;

    double value;
    try {
      value = double.parse(text);
    } catch (e) {
      return;
    }

    String formattedText = _numberFormat.format(value);
    if (_controller.text != formattedText) {
      _controller.value = _controller.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
      if (widget.onChanged != null) {
        widget.onChanged!(formattedText);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.textStyleInterW400S14Black,
      controller: _controller,
      validator: widget.overrideValidator
          ? widget.validator
          : (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        }
        return widget.validator?.call(value);
      },
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: widget.readOnly == false
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: context.theme.primaryColor),
        )
            : OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        filled: widget.filled,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        fillColor: widget.fillColor,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: widget.hintStyle ?? AppTextStyles.textStyleInterW400S16Black,
        labelStyle: widget.labelStyle ?? AppTextStyles.textStyleInterW400S16Black,
      ),
    );
  }
}
