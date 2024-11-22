import 'package:equatable/equatable.dart';

class SKY_ETicket_Status extends Equatable {
  SKY_ETicket_Status({
    required this.OrgID,
    required this.TicketStatus,
    required this.NetworkID,
    required this.AgentTicketStatusName,
    required this.CustomerTicketStatusName,
    required this.FlagUseType,
    required this.FlagActive,
    required this.Remark,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  final String OrgID;
  final String TicketStatus;
  final String NetworkID;
  final String AgentTicketStatusName;
  final String CustomerTicketStatusName;
  final String FlagUseType;
  final String Remark;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    TicketStatus,
    NetworkID,
    AgentTicketStatusName,
    CustomerTicketStatusName,
    FlagUseType,
    Remark,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}
