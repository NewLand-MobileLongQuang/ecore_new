import 'package:equatable/equatable.dart';

class SKY_CustomerGroup extends Equatable {
  SKY_CustomerGroup({required this.OrgID, required this.ColGrpCodeSys, required this.NetworkID, required this.ScrTplCodeSys, required this.ColGrpCode, required this.ColGrpName, required this.OrderIdx, required this.FlagActive, required this.LogLUDTimeUTC, required this.LogLUBy});

  final String OrgID;
  final String ColGrpCodeSys;
  final String NetworkID;
  final String ScrTplCodeSys;
  final String ColGrpCode;
  final String ColGrpName;
  final int OrderIdx;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    ColGrpCodeSys,
    NetworkID,
    ScrTplCodeSys,
    ColGrpCode,
    ColGrpName,
    OrderIdx,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
  ];

}