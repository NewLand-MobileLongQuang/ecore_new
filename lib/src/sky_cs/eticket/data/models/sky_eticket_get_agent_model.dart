import '../../domain/entities/sky_eticket_get_agent.dart';

class SKY_ETicket_Agent_Model extends SKY_ETicket_Agent {
  SKY_ETicket_Agent_Model(
      {required super.DepartmentCode,
        required super.UserCode,
        required super.OrgID,
        required super.NetworkID,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
        required super.su_UserName,});

  factory SKY_ETicket_Agent_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_Agent_Model(
      DepartmentCode: json['DepartmentCode']?.toString() ?? '',
      UserCode: json['UserCode']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      su_UserName: json['su_UserName']?.toString() ?? '',

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'DepartmentCode': super.DepartmentCode,
      'UserCode': super.UserCode,
      'OrgID': super.OrgID,
      'NetworkID': super.NetworkID,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'su_UserName': super.su_UserName,
    };
  }
}