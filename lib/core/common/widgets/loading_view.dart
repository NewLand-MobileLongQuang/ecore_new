import 'package:ecore/core/res/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../extensions/context_extension.dart';
import 'package:flutter/material.dart';


class LoadingView extends StatelessWidget{
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        color: AppColors.primaryColor,
        size: 40,
      ),
    );
  }
}
