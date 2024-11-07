import 'package:get_it/get_it.dart';
import '../configs/app_config.dart';
import '../configs/app_config_base.dart';
import '../configs/app_config_dev.dart';
import '../configs/app_config_production.dart';

import 'injection/e_service_injection.dart';

import 'injection/common_injection.dart';

final sl = GetIt.instance;

Future<void> init(AppEnviroments env) async {
  if (env == AppEnviroments.development)
    sl.registerLazySingleton<AppConfigValuesBase>(() => AppConfigValuesDev());
  else if (env == AppEnviroments.production)
    sl.registerLazySingleton<AppConfigValuesBase>(
            () => AppConfigValuesProduction());

  await authInit();
  await callInit();
  await localizationInit();
  await eServiceManageInit();
  //await _onboardingInit();
}
