import '../../../../utils/typedef.dart';
import '../../domain/entities/sys_user.dart';

class DataUserModel extends DataUser {
  DataUserModel({
    required super.sysUser,
    required super.listAccess,
  });

  factory DataUserModel.fromMap(DataMap map) {
    return DataUserModel(
      sysUser: map['sysUser'] != null
        ? map['sysUser'] as SysUserModel
            : SysUserModel(
        UserCode: '',NetworkID: '', UserName: '', UserPassword: '',
        UserPasswordNew: '', PhoneNo: '', MST: '', OrganCode: '', DepartmentCode: '',
        Position: '', VerificationCode: '', Avatar: '', UUID: '', FlagDLAdmin: '',
        FlagSysAdmin: '', FlagNNTAdmin: '', OrgID: '', CustomerCodeSys: '', CustomerCode: '', CustomerName: '',
        FlagActive: '', LogLUDTimeUTC: '', ACId: '', ACAvatar: '', ACEmail: '', ACLanguage: '', ACName: '',
        ACPhone: '', ACTimeZone: '', AuthorizeDTimeStart: '', mo_OrganCode: '', mo_OrganName: '', mdept_DepartmentCode: '',
        mdept_DepartmentName: '', mnnt_DealerType: '', ctitctg_CustomerGrpCode: '', DepartmentName: '', GroupName: '', UserType: ''),
      listAccess: map['listAccess'] != null ? map['listAccess'] as List<SysAccessModel> : <SysAccessModel>[]);
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


  factory SysUserModel.fromMap(DataMap map) {
    return SysUserModel(
      UserCode: map['UserCode'] as String? ?? '',
      NetworkID: map['NetworkID'] as String? ?? '',
      UserName: map['UserName'] as String? ?? '',
      UserPassword: map['UserPassword'] as String? ?? '',
      UserPasswordNew: map['UserPasswordNew'] as String? ?? '',
      PhoneNo: map['PhoneNo'] as String? ?? '',
      MST: map['MST'] as String? ?? '',
      OrganCode: map['OrganCode'] as String? ?? '',
      DepartmentCode: map['DepartmentCode'] as String? ?? '',
      Position: map['Position'] as String? ?? '',
      VerificationCode: map['VerificationCode'] as String? ?? '',
      Avatar: map['Avatar'] as String? ?? '',
      UUID: map['UUID'] as String? ?? '',
      FlagDLAdmin: map['FlagDLAdmin'] as String? ?? '',
      FlagSysAdmin: map['FlagSysAdmin'] as String? ?? '',
      FlagNNTAdmin: map['FlagNNTAdmin'] as String? ?? '',
      OrgID: map['OrgID'] as String? ?? '',
      CustomerCodeSys: map['CustomerCodeSys'] as String? ?? '',
      CustomerCode: map['CustomerCode'] as String? ?? '',
      CustomerName: map['CustomerName'] as String? ?? '',
      FlagActive: map['FlagActive'] as String? ?? '',
      LogLUDTimeUTC: map['LogLUDTimeUTC'] as String? ?? '',
      ACId: map['ACId'] as String? ?? '',
      ACAvatar: map['ACAvatar'] as String? ?? '',
      ACEmail: map['ACEmail'] as String? ?? '',
      ACLanguage: map['ACLanguage'] as String? ?? '',
      ACName: map['ACName'] as String? ?? '',
      ACPhone: map['ACPhone'] as String? ?? '',
      ACTimeZone: map['ACTimeZone'] as String? ?? '',
      AuthorizeDTimeStart: map['AuthorizeDTimeStart'] as String? ?? '',
      mo_OrganCode: map['mo_OrganCode'] as String? ?? '',
      mo_OrganName: map['mo_OrganName'] as String? ?? '',
      mdept_DepartmentCode: map['mdept_DepartmentCode'] as String? ?? '',
      mdept_DepartmentName: map['mdept_DepartmentName'] as String? ?? '',
      mnnt_DealerType: map['mnnt_DealerType'] as String? ?? '',
      ctitctg_CustomerGrpCode: map['ctitctg_CustomerGrpCode'] as String? ?? '',
      DepartmentName: map['DepartmentName'] as String? ?? '',
      GroupName: map['GroupName'] as String? ?? '',
      UserType: map['UserType'] as String? ?? '',
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