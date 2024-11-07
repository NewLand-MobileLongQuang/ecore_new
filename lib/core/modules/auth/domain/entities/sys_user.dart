class DataUser {
  DataUser({
    required this.sysUser,
    required this.listAccess,
  });

  final SysUser sysUser;
  final List<SysAccess> listAccess;
}

class SysUser {
  SysUser({
    required this.UserCode,
    required this.NetworkID,
    required this.UserName,
    required this.UserPassword,
    required this.UserPasswordNew,
    required this.PhoneNo,
    required this.MST,
    required this.OrganCode,
    required this.DepartmentCode,
    required this.Position,
    required this.VerificationCode,
    required this.Avatar,
    required this.UUID,
    required this.FlagDLAdmin,
    required this.FlagSysAdmin,
    required this.FlagNNTAdmin,
    required this.OrgID,
    required this.CustomerCodeSys,
    required this.CustomerCode,
    required this.CustomerName,
    required this.FlagActive,
    required this.LogLUDTimeUTC,
    required this.ACId,
    required this.ACAvatar,
    required this.ACEmail,
    required this.ACLanguage,
    required this.ACName,
    required this.ACPhone,
    required this.ACTimeZone,
    required this.AuthorizeDTimeStart,
    required this.mo_OrganCode,
    required this.mo_OrganName,
    required this.mdept_DepartmentCode,
    required this.mdept_DepartmentName,
    required this.mnnt_DealerType,
    required this.ctitctg_CustomerGrpCode,
    required this.DepartmentName,
    required this.GroupName,
    required this.UserType,
  });

  final String UserCode;
  final String NetworkID;
  final String UserName;
  final String UserPassword;
  final String UserPasswordNew;
  final String PhoneNo;
  final String MST;
  final String OrganCode;
  final String DepartmentCode;
  final String Position;
  final String VerificationCode;
  final String Avatar;
  final String UUID;
  final String FlagDLAdmin;
  final String FlagSysAdmin;
  final String FlagNNTAdmin;
  final String OrgID;
  final String CustomerCodeSys;
  final String CustomerCode;
  final String CustomerName;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String ACId;
  final String ACAvatar;
  final String ACEmail;
  final String ACLanguage;
  final String ACName;
  final String ACPhone;
  final String ACTimeZone;
  final String AuthorizeDTimeStart;
  final String mo_OrganCode;
  final String mo_OrganName;
  final String mdept_DepartmentCode;
  final String mdept_DepartmentName;
  final String mnnt_DealerType;
  final String ctitctg_CustomerGrpCode;
  final String DepartmentName;
  final String GroupName;
  final String UserType;
}

class SysAccess {
  SysAccess({
    required this.GroupCode,
    required this.OrgID,
    required this.ObjectCode,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
    required this.so_ObjectCode,
    required this.so_ObjectName,
    required this.so_ServiceCode,
    required this.so_ObjectType,
    required this.so_FlagExecModal,
    required this.so_FlagActive,
  });

  final String GroupCode;
  final String OrgID;
  final String ObjectCode;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String so_ObjectCode;
  final String so_ObjectName;
  final String so_ServiceCode;
  final String so_ObjectType;
  final String so_FlagExecModal;
  final String so_FlagActive;
}