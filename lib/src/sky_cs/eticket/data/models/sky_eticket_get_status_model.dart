import '../../domain/entities/sky_eticket_get_priority.dart';
import '../../domain/entities/sky_eticket_get_status.dart';

class SKY_ETicket_Status_Model extends SKY_ETicket_Status {
  SKY_ETicket_Status_Model(
      {required super.NetworkID,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
        required super.FlagActive,
        required super.OrgID,
        required super.Remark,
        required super.TicketStatus,
        required super.AgentTicketStatusName,
        required super.CustomerTicketStatusName,
        required super.FlagUseType,
      });

  factory SKY_ETicket_Status_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_Status_Model(
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      Remark: json['Remark']?.toString() ?? '',
      TicketStatus: json['TicketStatus']?.toString() ?? '',
      AgentTicketStatusName: json['AgentTicketStatusName']?.toString() ?? '',
      CustomerTicketStatusName: json['CustomerTicketStatusName']?.toString() ?? '',
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
      'TicketStatus': super.TicketStatus,
      'AgentTicketStatusName': super.AgentTicketStatusName,
      'CustomerTicketStatusName': super.CustomerTicketStatusName,
      'FlagUseType':super.FlagUseType
    };
  }
}