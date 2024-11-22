import 'package:equatable/equatable.dart';

class SKY_TicketCustomer extends Equatable {
  SKY_TicketCustomer({
    required this.OrgID,
    required this.CustomerCodeSys,
    required this.TicketID,
    required this.NetworkID,
    required this.CustomerCode,
    required this.CustomerName,
    required this.CustomerPhoneNo,
    required this.CustomerEmail,
    required this.ZaloUserFollowerId,
    required this.ZaloUserID,
    required this.CustomerAvatarPath,
    required this.PartnerType,
    required this.CustomerType,
    required this.CustomerGender,
    required this.CustomerDateOfBirth,
    required this.CustomerPosition,
    required this.CustomerCompany,
    required this.CustomerGrpCode,
    required this.CustomerSourceCode,
    required this.NationCode,
    required this.ProvinceCode,
    required this.DistrictCode,
    required this.WardCode,
    required this.AreaCode,
    required this.CustomerAddress,
    required this.PostalCode,
    required this.CreateDTimeUTC,
    required this.CreateBy,
    required this.FlagActive,
    required this.Remark,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
    required this.Lst_CustomerEmail,
    required this.Lst_CustomerPhoneNo,
    required this.Lst_ZaloUserFollowerId,
    required this.Lst_ZaloUserID,
  });

  final String OrgID;
  final String CustomerCodeSys;
  final String TicketID;
  final String NetworkID;
  final String CustomerCode;
  final String CustomerName;
  final String? CustomerPhoneNo;
  final String? CustomerEmail;
  final String ZaloUserFollowerId;
  final String? ZaloUserID;
  final String CustomerAvatarPath;
  final String? PartnerType;
  final String CustomerType;
  final String CustomerGender;
  final String CustomerDateOfBirth;
  final String CustomerPosition;
  final String CustomerCompany;
  final String CustomerGrpCode;
  final String CustomerSourceCode;
  final String NationCode;
  final String ProvinceCode;
  final String DistrictCode;
  final String WardCode;
  final String AreaCode;
  final String CustomerAddress;
  final String? PostalCode;
  final String CreateDTimeUTC;
  final String CreateBy;
  final String FlagActive;
  final String? Remark;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final List<String> Lst_CustomerEmail;
  final List<String> Lst_CustomerPhoneNo;
  final List<String> Lst_ZaloUserFollowerId;
  final List<String> Lst_ZaloUserID;

  @override
  List<Object?> get props => [
    OrgID,
    CustomerCodeSys,
    TicketID,
    NetworkID,
    CustomerCode,
    CustomerName,
    CustomerPhoneNo,
    CustomerEmail,
    ZaloUserFollowerId,
    ZaloUserID,
    CustomerAvatarPath,
    PartnerType,
    CustomerType,
    CustomerGender,
    CustomerDateOfBirth,
    CustomerPosition,
    CustomerCompany,
    CustomerGrpCode,
    CustomerSourceCode,
    NationCode,
    ProvinceCode,
    DistrictCode,
    WardCode,
    AreaCode,
    CustomerAddress,
    PostalCode,
    CreateDTimeUTC,
    CreateBy,
    FlagActive,
    Remark,
    LogLUDTimeUTC,
    LogLUBy,
    Lst_CustomerEmail,
    Lst_CustomerPhoneNo,
    Lst_ZaloUserFollowerId,
    Lst_ZaloUserID,
  ];
}
