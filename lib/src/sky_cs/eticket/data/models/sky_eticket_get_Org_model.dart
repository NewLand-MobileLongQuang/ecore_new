import '../../domain/entities/sky_eticket_get_Mst_Tags.dart';
import '../../domain/entities/sky_eticket_get_Org.dart';

class SKY_ETicket_Org_Model extends SKY_ETicket_Org {
  SKY_ETicket_Org_Model(
      {required super.NetworkID,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
        required super.FlagActive,
        required super.OrgID,
        required super.OrgParent,
        required super.OrgBUCode,
        required super.OrgBUPattern,
        required super.OrgLevel,
        required super.Remark,
        required super.MST,
        required super.mnnt_NNTFullName,});

  factory SKY_ETicket_Org_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_Org_Model(
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      OrgParent: json['OrgParent']?.toString() ?? '',
      OrgBUCode: json['OrgBUCode']?.toString() ?? '',
      OrgBUPattern: json['OrgBUPattern']?.toString() ?? '',
      OrgLevel: json['OrgLevel']?.toString() ?? '',
      Remark: json['Remark']?.toString() ?? '',
      MST: json['MST']?.toString() ?? '',
      mnnt_NNTFullName: json['mnnt_NNTFullName']?.toString() ?? '',

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'NetworkID': super.NetworkID,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'FlagActive': super.FlagActive,
      'OrgID': super.OrgID,
      'OrgParent': super.OrgParent,
      'OrgBUCode': super.OrgBUCode,
      'OrgBUPattern': super.OrgBUPattern,
      'OrgLevel': super.OrgLevel,
      'Remark': super.Remark,
      'MST': super.MST,
      'mnnt_NNTFullName': super.mnnt_NNTFullName,
    };
  }
}