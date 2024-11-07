import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../res/colors.dart';
import '../../../res/text_styles.dart';

class DateTimePickerField extends StatelessWidget {
  const DateTimePickerField({
    this.controller,
    this.filled = false,
    this.readOnly = false,
    this.overrideValidator = false,
    this.validator,
    this.fillColor,
    this.hintText,
    this.label,
    this.hintStyle,
    this.labelStyle,
    this.datePickerFirstDate,
    this.datePickerLastDate,
    this.initialDateTime,
    this.onTap,
    super.key,
  });

  final TextEditingController? controller;
  final bool filled;
  final Color? fillColor;
  final bool readOnly;
  final bool overrideValidator;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? label;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final DateTime? initialDateTime;
  final DateTime? datePickerFirstDate;
  final DateTime? datePickerLastDate;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    final selectedDateTime = initialDateTime ?? DateTime.now();

    Future<void> showDateTimePicker() async {
      final picked = await showDatePicker(
        context: context,
        initialDate: selectedDateTime,
        firstDate: datePickerFirstDate ?? DateTime(1900),
        lastDate: datePickerLastDate ?? DateTime(2201),
      );
      if (picked != null) {
        final timePicked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(selectedDateTime),
        );
        if (timePicked != null) {
          final newDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            timePicked.hour,
            timePicked.minute,
          );
          if (controller != null) {
            controller!.text = DateFormat('yyyy-MM-dd HH:mm:ss').format(newDateTime);
          }
        }
        if(onTap != null) {
          await onTap!();
        }
      }
    }

    return TextFormField(
      style: AppTextStyles.textStyleInterW400S14Black,
      controller: controller,
      readOnly: true,
      onTap: readOnly ? null : showDateTimePicker,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        filled: filled,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        fillColor: fillColor,
        suffixIcon: const Icon(Icons.calendar_month),
        hintText: hintText,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: hintStyle ?? AppTextStyles.textStyleInterW400S16Black,
        labelStyle: labelStyle ?? AppTextStyles.textStyleInterW400S16Black,
      ),
    );
  }
}
