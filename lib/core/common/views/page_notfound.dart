
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../res/media_res.dart';
import '../widgets/gradient_background.dart';

class PageNotfound extends StatelessWidget {
  const PageNotfound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(child: Lottie.asset(MediaRes.underConstructionLottie)),
        image: MediaRes.backgroundImg,
      ),
    );
  }
}
