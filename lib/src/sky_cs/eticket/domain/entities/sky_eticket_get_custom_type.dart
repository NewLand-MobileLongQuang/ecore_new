import 'package:equatable/equatable.dart';

class SKY_ETicket_CustomType extends Equatable {
  SKY_ETicket_CustomType({
    required this.OrgID,
    required this.TicketCustomType,
    required this.NetworkID,
    required this.AgentTicketCustomTypeName,
    required this.CustomerTicketCustomTypeName,
    required this.FlagUseType,
    required this.FlagActive,
    required this.Remark,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  final String OrgID;
  final String TicketCustomType;
  final String NetworkID;
  final String AgentTicketCustomTypeName;
  final String CustomerTicketCustomTypeName;
  final String FlagUseType;
  final String Remark;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    TicketCustomType,
    NetworkID,
    AgentTicketCustomTypeName,
    CustomerTicketCustomTypeName,
    FlagUseType,
    Remark,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}
