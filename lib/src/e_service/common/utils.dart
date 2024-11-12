
import 'package:ecore/core/configs/app_config_base.dart';
import '../../../core/configs/app_config.dart';

class EServiceUtils {

  static const kSolutionCode='ESERVICE';

  const EServiceUtils._();
  static SolutionInfo getSolution()
  {
    return AppConfig.current().solutions[kSolutionCode]!;

  }
  static String getApiUrlKey()
  {
      return 'ApiUrl_$kSolutionCode';
  }

  static String getFullRouteName(String routeName)
  {
    return '${EServiceUtils.kSolutionCode}/$routeName';
  }

}