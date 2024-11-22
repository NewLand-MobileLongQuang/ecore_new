import '../../domain/entities/sky_eticket_get_ticketsource.dart';

class SKY_ETicket_TicketSource_Model extends SKY_ETicket_TicketSource {
  SKY_ETicket_TicketSource_Model(
      {required super.OrgID,
        required super.TicketSource,
        required super.NetworkID,
        required super.AgentTicketSourceName,
        required super.CustomerTicketSourceName,
        required super.FlagUseType,
        required super.FlagActive,
        required super.Remark,
        required super.LogLUDTimeUTC,
        required super.LogLUBy});

  factory SKY_ETicket_TicketSource_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_TicketSource_Model(
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      Remark: json['Remark']?.toString() ?? '',
      FlagUseType: json['FlagUseType']?.toString() ?? '',
      TicketSource: json['TicketSource']?.toString() ?? '',
      AgentTicketSourceName: json['AgentTicketSourceName']?.toString() ?? '',
      CustomerTicketSourceName: json['CustomerTicketSourceName']?.toString() ?? '',
    );}

  Map<String, dynamic> toMap() {
    return {
      'NetworkID': super.NetworkID,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'FlagActive': super.FlagActive,
      'OrgID': super.OrgID,
      'Remark': super.Remark,
      'TicketSource': super.TicketSource,
      'AgentTicketSourceName': super.AgentTicketSourceName,
      'CustomerTicketSourceName': super.CustomerTicketSourceName,
      'FlagUseType':super.FlagUseType
    };
  }
}