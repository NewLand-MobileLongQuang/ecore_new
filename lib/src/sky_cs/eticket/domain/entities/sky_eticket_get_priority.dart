import 'package:equatable/equatable.dart';

class SKY_ETicket_Priority extends Equatable {
  SKY_ETicket_Priority({
    required this.OrgID,
    required this.TicketPriority,
    required this.NetworkID,
    required this.AgentTicketPriorityName,
    required this.CustomerTicketPriorityName,
    required this.FlagUseType,
    required this.FlagActive,
    required this.Remark,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  final String OrgID;
  final String TicketPriority;
  final String NetworkID;
  final String AgentTicketPriorityName;
  final String CustomerTicketPriorityName;
  final String FlagUseType;
  final String Remark;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    TicketPriority,
    NetworkID,
    AgentTicketPriorityName,
    CustomerTicketPriorityName,
    FlagUseType,
    Remark,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}
