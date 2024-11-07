import 'package:flutter/foundation.dart';

class ADSearchModel {
  final String colGrpCodeSys;
  final String colCodeSys;
  final String colCaption;
  final String orderIdx;
  final String colDataType;
  final String sqlOperatorType;
  final String mdmcJsonListOption;
  final String flagActive;

  ADSearchModel({
    required this.colGrpCodeSys,
    required this.colCodeSys,
    required this.colCaption,
    required this.orderIdx,
    required this.colDataType,
    required this.sqlOperatorType,
    required this.mdmcJsonListOption,
    required this.flagActive,
  });

  factory ADSearchModel.fromJson(Map<String, dynamic> json) {
    return ADSearchModel(
      colGrpCodeSys: json['ColGrpCodeSys'].toString(),
      colCodeSys: json['ColCodeSys'].toString(),
      colCaption: json['ColCaption'].toString(),
      orderIdx: json['OrderIdx'].toString(),
      colDataType: json['ColDataType'].toString(),
      sqlOperatorType: json['SqlOperatorType'].toString(),
      mdmcJsonListOption: json['mdmc_JsonListOption'].toString(),
      flagActive: json['FlagActive'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ColGrpCodeSys': colGrpCodeSys,
      'ColCodeSys': colCodeSys,
      'ColCaption': colCaption,
      'OrderIdx': orderIdx,
      'ColDataType': colDataType,
      'SqlOperatorType': sqlOperatorType,
      'mdmc_JsonListOption': mdmcJsonListOption,
      'FlagActive': flagActive,
    };
  }
}
