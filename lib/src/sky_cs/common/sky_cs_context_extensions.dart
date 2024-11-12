import 'package:ecore/src/sky_cs/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/utils/localization_helper.dart';


extension SkyCsContextExtensions on BuildContext {

  LocalizationHelper localizer(String cate)
  {
    return LocalizationHelper('${SkyCsUtils.kSolutionCode}_${cate}');
  }

  Future<T?> pushNamed<T extends Object?>(
      String routeName, {
        Object? arguments,
      }) {
    return Navigator.of(this).pushNamed<T>(SkyCsUtils.getFullRouteName(routeName), arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?>(
      String routeName, {
        T? result,
        Object? arguments,
      }) {
    return Navigator.of(this).pushReplacementNamed<T, T>(SkyCsUtils.getFullRouteName(routeName), result: result, arguments: arguments);
  }
}
