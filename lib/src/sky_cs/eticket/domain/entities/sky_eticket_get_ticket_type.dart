import 'package:equatable/equatable.dart';

class SKY_ETicket_Type extends Equatable {
  SKY_ETicket_Type({
    required this.OrgID,
    required this.TicketType,
    required this.NetworkID,
    required this.AgentTicketTypeName,
    required this.CustomerTicketTypeName,
    required this.ScrTplCreateCodeSys,
    required this.ScrTplDetailCodeSys,
    required this.TicketTypeHO,
    required this.FlagUseType,
    required this.FlagActive,
    required this.Remark,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
    required this.Idx,});


  final String OrgID;
  final String TicketType;
  final String NetworkID;
  final String AgentTicketTypeName;
  final String CustomerTicketTypeName;
  final String ScrTplCreateCodeSys;
  final String ScrTplDetailCodeSys;
  final String TicketTypeHO;
  final String FlagUseType;
  final String Remark;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String Idx;

  @override
  List<Object?> get props => [
    OrgID,
    TicketType,
    NetworkID,
    AgentTicketTypeName,
    CustomerTicketTypeName,
    ScrTplCreateCodeSys,
    ScrTplDetailCodeSys,
    FlagUseType,
    Remark,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
    Idx,
  ];
}
