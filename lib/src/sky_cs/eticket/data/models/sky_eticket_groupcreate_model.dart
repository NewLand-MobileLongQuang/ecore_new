
import '../../domain/entities/sky_eticket_group.dart';

class SKY_EticketGroupModel extends SKY_EticketGroup {
  SKY_EticketGroupModel({
    required super.OrgID,
    required super.ETScrTplCodeSys,
    required super.NetworkID,
    required super.ScrTplCode,
    required super.ScrTplName,
    required super.FlagDefault,
    required super.FlagActive,
    required super.CreateDTimeUTC,
    required super.CreateBy,
    required super.LogLUDTimeUTC,
    required super.LogLUBy});

  factory SKY_EticketGroupModel.fromJson(Map<String, dynamic> json) {
    return SKY_EticketGroupModel(
      OrgID: json['OrgID'] as String? ?? '',
      ETScrTplCodeSys: json['ETScrTplCodeSys'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      ScrTplCode: json['ScrTplCode'] as String? ?? '',
      ScrTplName: json['ScrTplName'] as String? ?? '',
      FlagDefault: json['FlagDefault'] as String? ?? '',
      FlagActive: json['FlagActive'] as String? ?? '',
      CreateDTimeUTC: json['CreateDTimeUTC'] as String? ?? '',
      CreateBy: json['CreateBy'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': OrgID,
      'ETScrTplCodeSys': ETScrTplCodeSys,
      'NetworkID': NetworkID,
      'ScrTplCode': ScrTplCode,
      'ScrTplName': ScrTplName,
      'FlagDefault': FlagDefault,
      'FlagActive': FlagActive,
      'CreateDTimeUTC': CreateDTimeUTC,
      'CreateBy': CreateBy,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}