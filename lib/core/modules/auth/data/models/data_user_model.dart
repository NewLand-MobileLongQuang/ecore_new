

import '../../../../utils/typedef.dart';
import '../../domain/entities/sys_user.dart';

class DataUserModel extends DataUser {
  DataUserModel({
    required super.sysUser,
    required super.listAccess,
  });

  factory DataUserModel.fromMap(Map<String, dynamic> json) {
    return DataUserModel(
      sysUser: json['Sys_User'] as SysUserModel,
      listAccess: json['Lst_Sys_Access'] != null
          ? (json['Lst_Sys_Access'] as List).map((item) => SysAccessModel.fromMap(item as Map<String, dynamic>)).toList()
          : <SysAccessModel>[]
    );
  }
}

class SysUserModel extends SysUser {
  SysUserModel({
    required super.UserCode,
    required super.NetworkID,
    required super.UserName,
    required super.UserPassword,
    required super.UserPasswordNew,
    required super.PhoneNo,
    required super.MST,
    required super.OrganCode,
    required super.DepartmentCode,
    required super.Position,
    required super.VerificationCode,
    required super.Avatar,
    required super.UUID,
    required super.FlagDLAdmin,
    required super.FlagSysAdmin,
    required super.FlagNNTAdmin,
    required super.OrgID,
    required super.CustomerCodeSys,
    required super.CustomerCode,
    required super.CustomerName,
    required super.FlagActive,
    required super.LogLUDTimeUTC,
    required super.ACId,
    required super.ACAvatar,
    required super.ACEmail,
    required super.ACLanguage,
    required super.ACName,
    required super.ACPhone,
    required super.ACTimeZone,
    required super.AuthorizeDTimeStart,
    required super.mo_OrganCode,
    required super.mo_OrganName,
    required super.mdept_DepartmentCode,
    required super.mdept_DepartmentName,
    required super.mnnt_DealerType,
    required super.ctitctg_CustomerGrpCode,
    required super.DepartmentName,
    required super.GroupName,
    required super.UserType,
  });


  factory SysUserModel.fromMap(Map<String, dynamic> json) {
    return SysUserModel(
      UserCode: json['UserCode'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      UserName: json['UserName'] as String? ?? '',
      UserPassword: json['UserPassword'] as String? ?? '',
      UserPasswordNew: json['UserPasswordNew'] as String? ?? '',
      PhoneNo: json['PhoneNo'] as String? ?? '',
      MST: json['MST'] as String? ?? '',
      OrganCode: json['OrganCode'] as String? ?? '',
      DepartmentCode: json['DepartmentCode'] as String? ?? '',
      Position: json['Position'] as String? ?? '',
      VerificationCode: json['VerificationCode'] as String? ?? '',
      Avatar: json['Avatar'] as String? ?? '',
      UUID: json['UUID'] as String? ?? '',
      FlagDLAdmin: json['FlagDLAdmin'] as String? ?? '',
      FlagSysAdmin: json['FlagSysAdmin'] as String? ?? '',
      FlagNNTAdmin: json['FlagNNTAdmin'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CustomerCode: json['CustomerCode'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      FlagActive: json['FlagActive'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      ACId: json['ACId'] as String? ?? '',
      ACAvatar: json['ACAvatar'] as String? ?? '',
      ACEmail: json['ACEmail'] as String? ?? '',
      ACLanguage: json['ACLanguage'] as String? ?? '',
      ACName: json['ACName'] as String? ?? '',
      ACPhone: json['ACPhone'] as String? ?? '',
      ACTimeZone: json['ACTimeZone'] as String? ?? '',
      AuthorizeDTimeStart: json['AuthorizeDTimeStart'] as String? ?? '',
      mo_OrganCode: json['mo_OrganCode'] as String? ?? '',
      mo_OrganName: json['mo_OrganName'] as String? ?? '',
      mdept_DepartmentCode: json['mdept_DepartmentCode'] as String? ?? '',
      mdept_DepartmentName: json['mdept_DepartmentName'] as String? ?? '',
      mnnt_DealerType: json['mnnt_DealerType'] as String? ?? '',
      ctitctg_CustomerGrpCode: json['ctitctg_CustomerGrpCode'] as String? ?? '',
      DepartmentName: json['DepartmentName'] as String? ?? '',
      GroupName: json['GroupName'] as String? ?? '',
      UserType: json['UserType'] as String? ?? '',
    );
  }
}

class SysAccessModel extends SysAccess {
  SysAccessModel({
    required super.GroupCode,
    required super.OrgID,
    required super.ObjectCode,
    required super.LogLUDTimeUTC,
    required super.LogLUBy,
    required super.so_ObjectCode,
    required super.so_ObjectName,
    required super.so_ServiceCode,
    required super.so_ObjectType,
    required super.so_FlagExecModal,
    required super.so_FlagActive,
  });

  factory SysAccessModel.fromMap(DataMap map) {
    return SysAccessModel(
      GroupCode: map['GroupCode'] as String? ?? '',
      OrgID: map['OrgID'] as String? ?? '',
      ObjectCode: map['ObjectCode'] as String? ?? '',
      LogLUDTimeUTC: map['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: map['LogLUBy'] as String? ?? '',
      so_ObjectCode: map['so_ObjectCode'] as String? ?? '',
      so_ObjectName: map['so_ObjectName'] as String? ?? '',
      so_ServiceCode: map['so_ServiceCode'] as String? ?? '',
      so_ObjectType: map['so_ObjectType'] as String? ?? '',
      so_FlagExecModal: map['so_FlagExecModal'] as String? ?? '',
      so_FlagActive: map['so_FlagActive'] as String? ?? '',
    );
  }
}