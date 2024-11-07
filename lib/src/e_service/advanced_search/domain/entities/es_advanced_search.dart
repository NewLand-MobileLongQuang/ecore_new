import 'package:equatable/equatable.dart';

class ES_AdvancedSearch extends Equatable {
  ES_AdvancedSearch({
    required this.colGrpCodeSys,
    required this.colCodeSys,
    required this.colCaption,
    required this.orderIdx,
    required this.colDataType,
    required this.sqlOperatorType,
    required this.mdmcJsonListOption,
    required this.flagActive,
  });

  final String colGrpCodeSys;
  final String colCodeSys;
  final String colCaption;
  final String orderIdx;
  final String colDataType;
  final String sqlOperatorType;
  final String mdmcJsonListOption;
  final String flagActive;
  @override
  List<Object?> get props => [colGrpCodeSys, colCodeSys, colCaption, orderIdx, colDataType, sqlOperatorType, mdmcJsonListOption, flagActive];
}