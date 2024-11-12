import 'package:ecore/core/common/views/page_notfound.dart';
import 'package:ecore/core/services/router/common_router.dart';
import 'package:ecore/core/services/router/e_service_router.dart';
import 'package:ecore/core/services/router/sky_cs_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  return handleCaseCommon(settings)
      ?? handleCaseEService(settings)
      ?? handleCaseSkyCS(settings)
      ?? handleDefault(settings);
}

PageRouteBuilder handleDefault(RouteSettings settings) {
  return pageBuilder((p0) => const PageNotfound(),
      settings: settings);
}

PageRouteBuilder<dynamic> pageBuilder(
    Widget Function(BuildContext) page, {
      required RouteSettings settings,
    }) {
  return PageRouteBuilder(
      settings: settings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      pageBuilder: (context, _, __) => page(context));
}
