import 'package:flutter/material.dart';

import '../../../res/text_styles.dart';


class IText extends StatelessWidget {
  const IText({
    required this.content,
    this.maxLine,
    super.key,
  });

  final String content;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        content,
        style: AppTextStyles.textStyleInterW400S14Black,
        maxLines: maxLine,
      ),
    );
  }
}
