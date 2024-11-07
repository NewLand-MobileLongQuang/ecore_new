import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/res/colors.dart';
import '../../../../core/res/text_styles.dart';


class CallRoundedButton extends StatelessWidget {
  const CallRoundedButton(
      {super.key,
      this.label,
      this.child,
      this.onPressed,
      this.buttonColor,
      this.labelColor,
      this.state= 0});
  final String? label;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? labelColor;
  final Widget? child;
  final int state;

  static const STATE_NORMAL=0;
  static const STATE_ACTIVE=1;
  static const STATE_INACTIVE=2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(

            backgroundColor: buttonColor ?? AppColors.greyLightColor,
            foregroundColor: labelColor ?? Colors.white,
            minimumSize: const Size(double.maxFinite, 50)),
        child: this.child?? Text(label??'', style: AppTextStyles.textStyleInterW500S32Black));
  }
}
