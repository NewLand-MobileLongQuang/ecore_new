import 'package:equatable/equatable.dart';

class SKY_ETicket_Org extends Equatable {
  SKY_ETicket_Org({
    required this.OrgID,
    required this.NetworkID,
    required this.OrgParent,
    required this.OrgBUCode,
    required this.OrgBUPattern,
    required this.OrgLevel,
    required this.Remark,
    required this.FlagActive,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
    required this.MST,
    required this.mnnt_NNTFullName,
  });

  final String OrgID;
  final String NetworkID;
  final String OrgParent;
  final String OrgBUCode;
  final String OrgBUPattern;
  final String OrgLevel;
  final String Remark;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String MST;
  final String mnnt_NNTFullName;

  @override
  List<Object?> get props => [
    OrgID,
    NetworkID,
    OrgParent,
    OrgBUCode,
    OrgBUPattern,
    OrgLevel,
    Remark,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
    MST,
    mnnt_NNTFullName,
  ];
}
