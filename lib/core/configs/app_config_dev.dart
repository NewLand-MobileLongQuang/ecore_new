import 'app_config_base.dart';

class AppConfigValuesDev extends AppConfigValuesBase
{
  @override
  String get appId => 'EcoreMobile';

  @override

  String get appSecret => '';

  @override
  String get ccsvBaseUrl=>'https://devccsv.ecore.vn';

  @override
  String get ccsvSolutionCode => 'DEV_ECORE_MOBILE';

  @override
  String get mobileServiceBaseUrl => 'https://devmobilesv.ecore.vn';

  @override
  String get callServiceBaseUrl =>  'https://devcc.ecore.vn';

  @override
  String get realtimeServiceBaseUrl => 'https://devrealtime.ecore.vn';

  @override
  String get entryCenterGateBaseUrl => 'https://devwebapi228.ecore.vn/idocNet.Test.EntryCenterGate.WA';

  @override
  String get entryCenterGateGwPassword => 'idocNet.idn.EntryCenterGate.Sv';

  @override
  String get entryCenterGateGwUserCode => 'idocNet.idn.EntryCenterGate.Sv';

  @override
  String get appAgent => 'Mobile-eService';

  @override
  String get appVerCode => 'V1';


  final Map<String, SolutionInfo> _solutions={
      "ESERVICE": SolutionInfo(
          code: 'ESERVICE',
          secretKey: '',
          gwUserCode: 'idocNet.idn.eService.Sv',
          gwPassword: 'idocNet.idn.eService.Sv',
          appAgent:  'Mobile-eService',
          appVerCode: 'V1',
          scrTplCodeSys: 'SCRTPLCODESYS.2023'),

      "SKYCS": SolutionInfo(
          code: 'DEVSKYCS',
          secretKey: '',
          gwUserCode: 'idocNet.idn.SkyCS.Sv',
          gwPassword: 'idocNet.idn.SkyCS.Sv',
          appAgent:  'Mobile-eService',
          appVerCode: 'V1',
          scrTplCodeSys: 'SCRTPLCODESYS.2023'),

  };

  @override
  Map<String, SolutionInfo> get solutions =>_solutions;

  @override
  String get scrTplCodeSys => 'SCRTPLCODESYS.2023';
}
