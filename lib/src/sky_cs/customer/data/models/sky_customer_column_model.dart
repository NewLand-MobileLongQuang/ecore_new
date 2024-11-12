import 'dart:convert';

import 'package:ecore/src/sky_cs/customer/data/models/sky_option_value_model.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_column.dart';


class SKY_CustomerColumnModel extends SKY_CustomerColumn {
  SKY_CustomerColumnModel({required super.OrgID, required super.ColGrpCodeSys, required super.ColCodeSys, required super.NetworkID, required super.ColOperatorType, required super.OrderIdx, required super.JsonRenderParams, required super.JsonListOption, required super.FlagIsNotNull, required super.FlagIsCheckDuplicate, required super.FlagIsQuery, required super.FlagActive, required super.LogLUDTimeUTC, required super.LogLUBy, required super.ColCode, required super.ColCaption, required super.ColDataType, required super.FlagIsColDynamic, required super.SqlOperatorType, required super.ScrTplCodeSys, required super.SolutionCode, required super.mdmc_JsonListOption, required super.Lst_MD_OptionValue});

  factory SKY_CustomerColumnModel.fromMap(Map<String, dynamic> json) {
    List<SKY_OptionValueModel> parseJsonListOption(String? jsonString) {
      if (jsonString == null) {
        return [];
      }
      List<dynamic> decoded = jsonDecode(jsonString) as List<dynamic>;
      return decoded
          .map((item) => SKY_OptionValueModel.fromMap(item as Map<String, dynamic>))
          .toList();
    }
    List<SKY_OptionValueModel> parseJsonListOption2(String? jsonString) {
      if (jsonString == null) {
        return [];
      }
      List<dynamic>? decoded = jsonDecode(jsonString) as List<dynamic>?;
      return decoded?.map((item) => SKY_OptionValueModel.fromMap(item as Map<String, dynamic>)).toList() ?? [];
    }


    return SKY_CustomerColumnModel(
      OrgID: json['OrgID'] as String? ?? '',
      ColGrpCodeSys: json['ColGrpCodeSys'] as String? ?? '',
      ColCodeSys: json['ColCodeSys'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      ColOperatorType: json['ColOperatorType'] as String? ?? '',
      OrderIdx: json['OrderIdx'] as int? ?? 0,
      JsonRenderParams: json['JsonRenderParams'] as String? ?? '',
      JsonListOption: json['JsonListOption'] as String? ?? '',
      FlagIsNotNull: json['FlagIsNotNull'] as String? ?? '',
      FlagIsCheckDuplicate: json['FlagIsCheckDuplicate'] as String? ?? '',
      FlagIsQuery: json['FlagIsQuery'] as String? ?? '',
      FlagActive: json['FlagActive'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
      ColCode: json['ColCode'] as String? ?? '',
      ColCaption: json['ColCaption'] as String? ?? '',
      ColDataType: json['ColDataType'] as String? ?? '',
      FlagIsColDynamic: json['FlagIsColDynamic'] as String? ?? '',
      SqlOperatorType: json['SqlOperatorType'] as String? ?? '',
      ScrTplCodeSys: json['ScrTplCodeSys'] as String? ?? '',
      SolutionCode: json['SolutionCode'] as String? ?? '',
      mdmc_JsonListOption: parseJsonListOption(json['mdmc_JsonListOption'] as String?),
      Lst_MD_OptionValue: (json['Lst_MD_OptionValue'] as List<dynamic>?)
          ?.map((item) => SKY_OptionValueModel.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': super.OrgID,
      'ColGrpCodeSys': super.ColGrpCodeSys,
      'ColCodeSys': super.ColCodeSys,
      'NetworkID': super.NetworkID,
      'ColOperatorType': super.ColOperatorType,
      'OrderIdx': super.OrderIdx,
      'JsonRenderParams': super.JsonRenderParams,
      'JsonListOption': super.JsonListOption,
      'FlagIsNotNull': super.FlagIsNotNull,
      'FlagIsCheckDuplicate': super.FlagIsCheckDuplicate,
      'FlagIsQuery': super.FlagIsQuery,
      'FlagActive': super.FlagActive,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'ColCode': super.ColCode,
      'ColCaption': super.ColCaption,
      'ColDataType': super.ColDataType,
      'FlagIsColDynamic': super.FlagIsColDynamic,
      'SqlOperatorType': super.SqlOperatorType,
      'ScrTplCodeSys': super.ScrTplCodeSys,
      'SolutionCode': super.SolutionCode,
      'mdmc_JsonListOption': jsonEncode(super.mdmc_JsonListOption),
      'Lst_MD_OptionValue': super.Lst_MD_OptionValue,
    };
  }
}