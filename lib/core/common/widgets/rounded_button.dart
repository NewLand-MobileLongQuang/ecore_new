import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.buttonColor,
      this.labelColor});
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.primaryColor,
            foregroundColor: labelColor ?? Colors.white,
            minimumSize: const Size(double.maxFinite, 50)),
        child: Text(label));
  }
}
