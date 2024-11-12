import 'package:ecore/src/sky_cs/customer/domain/entities/sky_option_value.dart';
import 'package:equatable/equatable.dart';

class SKY_CustomerColumn extends Equatable {
  SKY_CustomerColumn({required this.OrgID, required this.ColGrpCodeSys, required this.ColCodeSys, required this.NetworkID, required this.ColOperatorType, required this.OrderIdx, required this.JsonRenderParams, required this.JsonListOption, required this.FlagIsNotNull, required this.FlagIsCheckDuplicate, required this.FlagIsQuery, required this.FlagActive, required this.LogLUDTimeUTC, required this.LogLUBy, required this.ColCode, required this.ColCaption, required this.ColDataType, required this.FlagIsColDynamic, required this.SqlOperatorType, required this.ScrTplCodeSys, required this.SolutionCode, required this.mdmc_JsonListOption, required this.Lst_MD_OptionValue});

  final String OrgID;
  final String ColGrpCodeSys;
  final String ColCodeSys;
  final String NetworkID;
  final String ColOperatorType;
  final int OrderIdx;
  final String JsonRenderParams;
  final String JsonListOption;
  final String FlagIsNotNull;
  final String FlagIsCheckDuplicate;
  final String FlagIsQuery;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String ColCode;
  final String ColCaption;
  final String ColDataType;
  final String FlagIsColDynamic;
  final String SqlOperatorType;
  final String ScrTplCodeSys;
  final String SolutionCode;
  final List<SKY_OptionValue> mdmc_JsonListOption;
  final List<SKY_OptionValue> Lst_MD_OptionValue;

  @override
  List<Object?> get props => [
    OrgID,
    ColGrpCodeSys,
    ColCodeSys,
    NetworkID,
    ColOperatorType,
    OrderIdx,
    JsonRenderParams,
    JsonListOption,
    FlagIsNotNull,
    FlagIsCheckDuplicate,
    FlagIsQuery,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
    ColCode,
    ColCaption,
    ColDataType,
    FlagIsColDynamic,
    SqlOperatorType,
    ScrTplCodeSys,
    SolutionCode,
    mdmc_JsonListOption,
    Lst_MD_OptionValue,
  ];
}