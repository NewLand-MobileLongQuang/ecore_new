import 'package:equatable/equatable.dart';

class SKY_CustomerPhone extends Equatable {
  SKY_CustomerPhone({required this.OrgID, required this.CustomerCodeSys, required this.CtmPhoneNo, required this.NetworkID, required this.FlagDefault, required this.FlagActive, required this.LogLUDTimeUTC, required this.LogLUBy});


  final String OrgID;
  final String CustomerCodeSys;
  final String CtmPhoneNo;
  final String NetworkID;
  final String FlagDefault;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    CustomerCodeSys,
    CtmPhoneNo,
    NetworkID,
    FlagDefault,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}