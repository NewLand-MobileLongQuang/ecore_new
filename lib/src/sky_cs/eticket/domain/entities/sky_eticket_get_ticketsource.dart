import 'package:equatable/equatable.dart';

class SKY_ETicket_TicketSource extends Equatable {
  SKY_ETicket_TicketSource({
    required this.OrgID,
    required this.TicketSource,
    required this.NetworkID,
    required this.AgentTicketSourceName,
    required this.CustomerTicketSourceName,
    required this.FlagUseType,
    required this.FlagActive,
    required this.Remark,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  final String OrgID;
  final String TicketSource;
  final String NetworkID;
  final String AgentTicketSourceName;
  final String CustomerTicketSourceName;
  final String FlagUseType;
  final String Remark;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    TicketSource,
    NetworkID,
    AgentTicketSourceName,
    CustomerTicketSourceName,
    FlagUseType,
    Remark,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}
