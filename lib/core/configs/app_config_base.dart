class SolutionInfo{
  final String code;
  final String secretKey;
  final String gwUserCode;
  final String gwPassword;
  final String appAgent;
  final String appVerCode;

  final String scrTplCodeSys;

  SolutionInfo({required this.code, required this.secretKey, required this.gwUserCode, required this.gwPassword, required this.appAgent, required this.appVerCode, required this.scrTplCodeSys});


}
abstract class AppConfigValuesBase
{




  // MobileServiceSv
  String get appId;
  String get appSecret;
  String get mobileServiceBaseUrl;

  // EntryCenterGateSv
  String get entryCenterGateBaseUrl;
  String get entryCenterGateGwUserCode;
  String get entryCenterGateGwPassword;

  String  get appAgent;
  String get appVerCode;

  //call services
  String get callServiceBaseUrl;
  String get realtimeServiceBaseUrl;
  //ccsv
  String get ccsvSolutionCode;
  String get ccsvBaseUrl;

  Map<String, SolutionInfo> get solutions;


}

