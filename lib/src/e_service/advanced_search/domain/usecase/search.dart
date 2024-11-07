import 'package:equatable/equatable.dart';


import '../repos/es_advanced_search_repo.dart';

class SearchAdvancedParams extends Equatable {
  const SearchAdvancedParams({
    required this.OrgID,
    required this.ColGrpCodeSys,
    required this.ColCodeSys,
    required this.ColOperatorType,
    required this.OrderIdx,
    required this.FlagIsNotNull,
    required this.FlagIsCheckDuplicate,
    required this.FlagActive,
    required this.ColCode,
    required this.ColCaption,
    required this.ColDataType,
    required this.FlagIsColDynamic,
    required this.SqlOperatorType,
    required this.mdmc_JsonListOption,
  });

  final String OrgID;
  final String ColGrpCodeSys;
  final String ColCodeSys;
  final String ColOperatorType;
  final int OrderIdx;
  final String FlagIsNotNull;
  final String FlagIsCheckDuplicate;
  final String FlagActive;
  final String ColCode;
  final String ColCaption;
  final String ColDataType;
  final String FlagIsColDynamic;
  final String SqlOperatorType;
  final String mdmc_JsonListOption;

  @override
  List<Object?> get props => [
    OrgID,
    ColGrpCodeSys,
    ColCodeSys,
    ColOperatorType,
    OrderIdx,
    FlagIsNotNull,
    FlagIsCheckDuplicate,
    FlagActive,
    ColCode,
    ColCaption,
    ColDataType,
    FlagIsColDynamic,
    SqlOperatorType,
    mdmc_JsonListOption
  ];
}
