import '../../domain/entities/sky_eticket_get_department.dart';

class SKY_ETicket_Department_Model extends SKY_ETicket_Department {
  SKY_ETicket_Department_Model(
      { required super.DepartmentCode,
        required super.NetworkID,
        required super.DepartmentCodeParent,
        required super.DepartmentBUCode,
        required super.DepartmentBUPattern,
        required super.DepartmentLevel,
        required super.MST,
        required super.DepartmentName,
        required super.DepartmentDesc,
        required super.FlagActive,
        required super.FlagAutoDiv,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
        required super.su_QtyUser,
        required super.md_DepartmentNameParent, required super.OrgID,
      });

  factory SKY_ETicket_Department_Model.fromJson(Map<String, dynamic> json) {
    return SKY_ETicket_Department_Model(
      DepartmentCode: json['DepartmentCode']?.toString() ?? '',
      NetworkID: json['NetworkID']?.toString() ?? '',
      DepartmentCodeParent: json['DepartmentCodeParent']?.toString() ?? '',
      DepartmentBUCode: json['DepartmentBUCode']?.toString() ?? '',
      DepartmentBUPattern: json['DepartmentBUPattern']?.toString() ?? '',
      DepartmentLevel: json['DepartmentLevel']?.toString() ?? '',
      MST: json['MST']?.toString() ?? '',
      OrgID: json['OrgID']?.toString() ?? '',
      DepartmentName: json['DepartmentName']?.toString() ?? '',
      DepartmentDesc: json['DepartmentDesc']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
      FlagAutoDiv: json['FlagAutoDiv']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      su_QtyUser: json['su_QtyUser'] is int ? json['su_QtyUser'] as int : 0,
      md_DepartmentNameParent: json['md_DepartmentNameParent']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'DepartmentCode': super.DepartmentCode,
      'NetworkID': super.NetworkID,
      'DepartmentCodeParent': super.DepartmentCodeParent,
      'DepartmentBUCode': super.DepartmentBUCode,
      'DepartmentBUPattern': super.DepartmentBUPattern,
      'DepartmentLevel': super.DepartmentLevel,
      'MST': super.MST,
      'OrgID': super.OrgID,
      'DepartmentName': super.DepartmentName,
      'DepartmentDesc': super.DepartmentDesc,
      'FlagActive': super.FlagActive,
      'FlagAutoDiv': super.FlagAutoDiv,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'su_QtyUser': super.su_QtyUser,
      'md_DepartmentNameParent': super.md_DepartmentNameParent,
    };
  }
}