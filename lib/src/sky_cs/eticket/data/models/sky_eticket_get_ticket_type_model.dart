import '../../domain/entities/sky_eticket_get_ticket_type.dart';

class SKY_ETicket_Type_Model extends SKY_ETicket_Type {
  SKY_ETicket_Type_Model(
      {required super.OrgID,
        required super.TicketType,
        required super.NetworkID,
        required super.AgentTicketTypeName,
        required super.CustomerTicketTypeName,
        required super.ScrTplCreateCodeSys,
        required super.ScrTplDetailCodeSys,
        required super.TicketTypeHO,
        required super.FlagUseType,
        required super.FlagActive,
        required super.Remark,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
        required super.Idx,
      });

  factory SKY_ETicket_Type_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_Type_Model(
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      Remark: json['Remark']?.toString() ?? '',
      FlagUseType: json['FlagUseType']?.toString() ?? '',
      TicketType: json['TicketType']?.toString() ?? '',
      AgentTicketTypeName: json['AgentTicketTypeName']?.toString() ?? '',
      CustomerTicketTypeName: json['CustomerTicketTypeName']?.toString() ?? '',
      ScrTplCreateCodeSys: json['ScrTplCreateCodeSys']?.toString() ?? '',
      ScrTplDetailCodeSys: json['ScrTplDetailCodeSys']?.toString() ?? '',
      TicketTypeHO: json['TicketTypeHO']?.toString() ?? '',
      Idx: json['Idx']?.toString() ?? '',
    );}

  Map<String, dynamic> toMap() {
    return {
      'NetworkID': super.NetworkID,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'FlagActive': super.FlagActive,
      'OrgID': super.OrgID,
      'Remark': super.Remark,
      'TicketType': super.TicketType,
      'AgentTicketTypeName': super.AgentTicketTypeName,
      'CustomerTicketTypeName': super.CustomerTicketTypeName,
      'ScrTplCreateCodeSys': super.ScrTplCreateCodeSys,
      'ScrTplDetailCodeSys': super.ScrTplDetailCodeSys,
      'TicketTypeHO': super.TicketTypeHO,
      'Idx': super.Idx,
      'FlagUseType':super.FlagUseType
    };
  }
}