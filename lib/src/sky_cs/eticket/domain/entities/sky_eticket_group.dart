import 'package:equatable/equatable.dart';

class SKY_EticketGroup extends Equatable {
  SKY_EticketGroup({
    required this.OrgID,
    required this.ETScrTplCodeSys,
    required this.NetworkID,
    required this.ScrTplCode,
    required this.ScrTplName,
    required this.FlagDefault,
    required this.FlagActive,
    required this.CreateDTimeUTC,
    required this.CreateBy,
    required this.LogLUDTimeUTC,
    required this.LogLUBy});

  final String OrgID;
  final String ETScrTplCodeSys;
  final String NetworkID;
  final String ScrTplCode;
  final String ScrTplName;
  final String FlagDefault;
  final String FlagActive;
  final String CreateDTimeUTC;
  final String CreateBy;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    ETScrTplCodeSys,
    NetworkID,
    ScrTplCode,
    ScrTplName,
    FlagDefault,
    FlagActive,
    CreateDTimeUTC,
    CreateBy,
    LogLUDTimeUTC,
    LogLUBy
  ];

}