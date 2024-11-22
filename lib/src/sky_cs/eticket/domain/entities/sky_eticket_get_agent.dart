import 'package:equatable/equatable.dart';

class SKY_ETicket_Agent extends Equatable {
  SKY_ETicket_Agent({
    required this.DepartmentCode,
    required this.UserCode,
    required this.OrgID,
    required this.NetworkID,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
    required this.su_UserName,
  });

  final String DepartmentCode;
  final String UserCode;
  final String OrgID;
  final String NetworkID;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String su_UserName;

  @override
  List<Object?> get props => [
    DepartmentCode,
    UserCode,
    OrgID,
    NetworkID,
    LogLUDTimeUTC,
    LogLUBy,
    su_UserName,
  ];
}
