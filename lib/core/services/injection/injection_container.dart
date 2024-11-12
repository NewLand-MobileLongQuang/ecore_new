import 'package:ecore/core/services/injection/sky_cs_injection.dart';
import 'package:get_it/get_it.dart';
import '../../configs/app_config.dart';
import '../../configs/app_config_base.dart';
import '../../configs/app_config_dev.dart';
import '../../configs/app_config_production.dart';

import 'e_service_injection.dart';

import 'common_injection.dart';

final sl = GetIt.instance;

Future<void> init(AppEnviroments env) async {
  if (env == AppEnviroments.development) {
    sl.registerLazySingleton<AppConfigValuesBase>(() => AppConfigValuesDev());
  }
  else if (env == AppEnviroments.production) {
    sl.registerLazySingleton<AppConfigValuesBase>(() => AppConfigValuesProduction());
  }

  await authInit();
  await callInit();
  await localizationInit();
  await eServiceManageInit();
  await skyCSManageInit();
}
