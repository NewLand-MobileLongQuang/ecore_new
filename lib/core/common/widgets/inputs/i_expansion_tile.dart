import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/text_styles.dart';

class IExpansionTile extends StatefulWidget {
  IExpansionTile({
    required this.title,
    required this.children,
    required this.trailingExpansionTrue,
    required this.trailingExpansionFalse,
    this.isCheck,
    this.initiallyExpanded,
    super.key,
  });

  bool? isCheck;
  final String title;
  final List<Widget> children;
  final Widget trailingExpansionTrue;
  final Widget trailingExpansionFalse;
  bool? initiallyExpanded;

  @override
  State<IExpansionTile> createState() => _IExpansionTileState();
}

class _IExpansionTileState extends State<IExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: widget.initiallyExpanded ?? true,
      tilePadding: const EdgeInsets.symmetric(horizontal:8),
      visualDensity: const VisualDensity(vertical: -4),
      shape: const Border(),
      trailing: widget.isCheck == false
          ? widget.trailingExpansionFalse
          : widget.trailingExpansionTrue,
      collapsedBackgroundColor: AppColors.greenLightColor,
      onExpansionChanged: (bool expanded){
        setState(() {
          widget.isCheck = expanded;
        });
      },
      title: Text(
        widget.title,
        style: AppTextStyles.textStyleInterW600S16Black,
      ),
      children: widget.children,
    );
  }
}
