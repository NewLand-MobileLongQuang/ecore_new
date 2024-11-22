import '../../domain/entities/sky_eticket_get_priority.dart';

class SKY_ETicket_Priority_Model extends SKY_ETicket_Priority {
  SKY_ETicket_Priority_Model(
      {required super.NetworkID,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
        required super.FlagActive,
        required super.OrgID,
        required super.Remark,
        required super.TicketPriority,
        required super.AgentTicketPriorityName,
        required super.CustomerTicketPriorityName,
        required super.FlagUseType,
       });

  factory SKY_ETicket_Priority_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_Priority_Model(
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      Remark: json['Remark']?.toString() ?? '',
      TicketPriority: json['TicketPriority']?.toString() ?? '',
      AgentTicketPriorityName: json['AgentTicketPriorityName']?.toString() ?? '',
      CustomerTicketPriorityName: json['CustomerTicketPriorityName']?.toString() ?? '',
      FlagUseType: json['FlagUseType']?.toString() ?? '',
    );}

  Map<String, dynamic> toMap() {
    return {
      'NetworkID': super.NetworkID,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'FlagActive': super.FlagActive,
      'OrgID': super.OrgID,
      'Remark': super.Remark,
      'TicketPriority': super.TicketPriority,
      'AgentTicketPriorityName': super.AgentTicketPriorityName,
      'CustomerTicketPriorityName': super.CustomerTicketPriorityName,
      'FlagUseType':super.FlagUseType
    };
  }
}