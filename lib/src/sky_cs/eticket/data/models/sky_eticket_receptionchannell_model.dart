import '../../domain/entities/sky_eticket_get_receptionchannel.dart';

class SKY_ETicket_ReceptionChannel_Model extends SKY_ETicket_ReceptionChannel {
  SKY_ETicket_ReceptionChannel_Model(
      {required super.OrgID,
        required super.ReceptionChannel,
        required super.NetworkID,
        required super.AgentReceptionChannelName,
        required super.CustomerReceptionChannelName,
        required super.FlagUseType,
        required super.FlagActive,
        required super.Remark,
        required super.LogLUDTimeUTC,
        required super.LogLUBy});

  factory SKY_ETicket_ReceptionChannel_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_ReceptionChannel_Model(
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      Remark: json['Remark']?.toString() ?? '',
      FlagUseType: json['FlagUseType']?.toString() ?? '',
      ReceptionChannel: json['ReceptionChannel']?.toString() ?? '',
      AgentReceptionChannelName: json['AgentReceptionChannelName']?.toString() ?? '',
      CustomerReceptionChannelName: json['CustomerReceptionChannelName']?.toString() ?? '',
    );}

  Map<String, dynamic> toMap() {
    return {
      'NetworkID': super.NetworkID,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'FlagActive': super.FlagActive,
      'OrgID': super.OrgID,
      'Remark': super.Remark,
      'ReceptionChannel': super.ReceptionChannel,
      'AgentReceptionChannelName': super.AgentReceptionChannelName,
      'CustomerReceptionChannelName': super.CustomerReceptionChannelName,
      'FlagUseType':super.FlagUseType
    };
  }
}