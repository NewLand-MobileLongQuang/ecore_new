import '../../domain/entities/sky_eticket_template.dart';

class SKY_ETicket_MetaScreenTemplate_Model extends SKY_ETicket_MetaScreenTemplate {
  SKY_ETicket_MetaScreenTemplate_Model(
      {required super.OrgID,
        required super.ETScrTplCodeSys,
        required super.NetworkID,
        required super.ScrTplCode,
        required super.ScrTplName,
        required super.FlagDefault,
        required super.FlagActive,
        required super.CreateDTimeUTC,
        required super.CreateBy,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
      });

  factory SKY_ETicket_MetaScreenTemplate_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_MetaScreenTemplate_Model(
      OrgID: json['OrgID']?.toString() ?? '',
      ETScrTplCodeSys: json['ETScrTplCodeSys']?.toString() ?? '',
      NetworkID: json['NetworkID']?.toString() ?? '',
      ScrTplCode: json['ScrTplCode']?.toString() ?? '',
      ScrTplName: json['ScrTplName']?.toString() ?? '',
      FlagDefault: json['FlagDefault']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      CreateDTimeUTC: json['CreateDTimeUTC']?.toString() ?? '',
      CreateBy: json['CreateBy']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': super.OrgID,
      'ETScrTplCodeSys': super.ETScrTplCodeSys,
      'NetworkID': super.NetworkID,
      'ScrTplCode': super.ScrTplCode,
      'ScrTplName': super.ScrTplName,
      'FlagDefault': super.FlagDefault,
      'FlagActive': super.FlagActive,
      'CreateDTimeUTC': super.CreateDTimeUTC,
      'CreateBy': super.CreateBy,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
    };
  }
}