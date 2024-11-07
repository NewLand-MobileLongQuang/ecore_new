import '../services/injection_container.dart';
import 'app_config_base.dart';
enum AppEnviroments{
  development, production
}
class AppConfig
{
  static AppConfigValuesBase current() {

    //   final sl = GetIt.instance;
    return sl<AppConfigValuesBase>();
  }


}