import 'package:ecore/src/e_service/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/utils/localization_helper.dart';


extension SolutionContextExtensions on BuildContext {


  LocalizationHelper localizer(String cate)
  {
    return LocalizationHelper('${EserviceUtils.kSolutionCode}_${cate}');
  }

  Future<T?> pushNamed<T extends Object?>(
      String routeName, {
        Object? arguments,
      }) {
    return Navigator.of(this).pushNamed<T>(EserviceUtils.getFullRouteName(routeName), arguments: arguments);
  }
}
