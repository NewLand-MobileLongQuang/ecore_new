import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/text_styles.dart';

class IRadioButton extends StatefulWidget {
  IRadioButton({required this.value, required this.contents, super.key});

  String value;
  final List<String> contents;

  @override
  State<IRadioButton> createState() => _IRadioButtonState();
}

class _IRadioButtonState extends State<IRadioButton> {
  @override
  void initState() {
    widget.value = widget.contents.first;
    super.initState();
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      widget.value = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.contents.map((String content) {
        return Row(
          children: [
            Radio(
              value: content,
              groupValue: widget.value,
              onChanged: _handleRadioValueChange,
              activeColor: AppColors.primaryColor,
            ),
            Text(
              content,
              style: AppTextStyles.textStyleInterW500S16Black,
            ),
          ],
        );
      }).toList(),
    );
  }
}
