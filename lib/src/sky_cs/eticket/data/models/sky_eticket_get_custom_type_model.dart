import '../../domain/entities/sky_eticket_get_custom_type.dart';


class SKY_ETicket_CustomType_Model extends SKY_ETicket_CustomType {
  SKY_ETicket_CustomType_Model(
      {required super.NetworkID,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
        required super.FlagActive,
        required super.OrgID,
        required super.Remark,
        required super.TicketCustomType,
        required super.AgentTicketCustomTypeName,
        required super.CustomerTicketCustomTypeName,
        required super.FlagUseType,
      });

  factory SKY_ETicket_CustomType_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_CustomType_Model(
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      Remark: json['Remark']?.toString() ?? '',
      TicketCustomType: json['TicketCustomType']?.toString() ?? '',
      AgentTicketCustomTypeName: json['AgentTicketCustomTypeName']?.toString() ?? '',
      CustomerTicketCustomTypeName: json['CustomerTicketCustomTypeName']?.toString() ?? '',
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
      'TicketCustomType': super.TicketCustomType,
      'AgentTicketCustomTypeName': super.AgentTicketCustomTypeName,
      'CustomerTicketCustomTypeName': super.CustomerTicketCustomTypeName,
      'FlagUseType':super.FlagUseType
    };
  }
}