import 'package:equatable/equatable.dart';

class SKY_ETicket_Department extends Equatable {
  SKY_ETicket_Department({
    required this.DepartmentCode,
    required this.NetworkID,
    required this.DepartmentCodeParent,
    required this.DepartmentBUCode,
    required this.DepartmentBUPattern,
    required this.DepartmentLevel,
    required this.MST,
    required this.OrgID,
    required this.DepartmentName,
    required this.DepartmentDesc,
    required this.FlagActive,
    required this.FlagAutoDiv,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
    required this.su_QtyUser,
    required this.md_DepartmentNameParent,
  });

  final String DepartmentCode;
  final String NetworkID;
  final String DepartmentCodeParent;
  final String DepartmentBUCode;
  final String DepartmentBUPattern;
  final String DepartmentLevel;
  final String MST;
  final String OrgID;
  final String DepartmentName;
  final String DepartmentDesc;
  final String FlagActive;
  final String FlagAutoDiv;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final int su_QtyUser;
  final String md_DepartmentNameParent;

  @override
  List<Object?> get props => [
    DepartmentCode,
    NetworkID,
    DepartmentCodeParent,
    DepartmentBUCode,
    DepartmentBUPattern,
    DepartmentLevel,
    MST,
    OrgID,
    DepartmentName,
    DepartmentDesc,
    FlagActive,
    FlagAutoDiv,
    LogLUDTimeUTC,
    LogLUBy,
    su_QtyUser,
    md_DepartmentNameParent,
  ];
}
