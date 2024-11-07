import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/text_styles.dart';

class ISwitch extends StatefulWidget {

  ISwitch({
    required this.value,
    required this.content,
    super.key,
  });
  bool value;
  final String content;

  @override
  State<ISwitch> createState() => _ISwitchState();
}

class _ISwitchState extends State<ISwitch> {

  void _handleSwitchValueChange(bool value) {
    setState(() {
      widget.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: widget.value,
            onChanged: _handleSwitchValueChange,
            activeColor: AppColors.primaryColor,
            activeTrackColor: AppColors.primaryOpa11,
          ),
        ),
        Text(
          widget.content,
          style: AppTextStyles.textStyleInterW500S16Black,
        ),
      ]
    );
  }
}