import '../../domain/entities/sky_eticket_getcustomer.dart';

class SKY_TicketCustomerModel extends SKY_TicketCustomer {
  SKY_TicketCustomerModel({
    required super.OrgID,
    required super.CustomerCodeSys,
    required super.TicketID,
    required super.NetworkID,
    required super.CustomerCode,
    required super.CustomerName,
    required super.CustomerPhoneNo,
    required super.CustomerEmail,
    required super.ZaloUserFollowerId,
    required super.ZaloUserID,
    required super.CustomerAvatarPath,
    required super.PartnerType,
    required super.CustomerType,
    required super.CustomerGender,
    required super.CustomerDateOfBirth,
    required super.CustomerPosition,
    required super.CustomerCompany,
    required super.CustomerGrpCode,
    required super.CustomerSourceCode,
    required super.NationCode,
    required super.ProvinceCode,
    required super.DistrictCode,
    required super.WardCode,
    required super.AreaCode,
    required super.CustomerAddress,
    required super.PostalCode,
    required super.CreateDTimeUTC,
    required super.CreateBy,
    required super.FlagActive,
    required super.Remark,
    required super.LogLUDTimeUTC,
    required super.LogLUBy,
    required super.Lst_CustomerEmail,
    required super.Lst_CustomerPhoneNo,
    required super.Lst_ZaloUserFollowerId,
    required super.Lst_ZaloUserID,
  });

  factory SKY_TicketCustomerModel.fromJson(Map<String, dynamic> json) {
    return SKY_TicketCustomerModel(
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      TicketID: json['TicketID'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      CustomerCode: json['CustomerCode'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      CustomerPhoneNo: json['CustomerPhoneNo'] as String?,
      CustomerEmail: json['CustomerEmail'] as String?,
      ZaloUserFollowerId: json['ZaloUserFollowerId'] as String? ?? '',
      ZaloUserID: json['ZaloUserID'] as String?,
      CustomerAvatarPath: json['CustomerAvatarPath'] as String? ?? '',
      PartnerType: json['PartnerType'] as String?,
      CustomerType: json['CustomerType'] as String? ?? '',
      CustomerGender: json['CustomerGender'] as String? ?? '',
      CustomerDateOfBirth: json['CustomerDateOfBirth'] as String? ?? '',
      CustomerPosition: json['CustomerPosition'] as String? ?? '',
      CustomerCompany: json['CustomerCompany'] as String? ?? '',
      CustomerGrpCode: json['CustomerGrpCode'] as String? ?? '',
      CustomerSourceCode: json['CustomerSourceCode'] as String? ?? '',
      NationCode: json['NationCode'] as String? ?? '',
      ProvinceCode: json['ProvinceCode'] as String? ?? '',
      DistrictCode: json['DistrictCode'] as String? ?? '',
      WardCode: json['WardCode'] as String? ?? '',
      AreaCode: json['AreaCode'] as String? ?? '',
      CustomerAddress: json['CustomerAddress'] as String? ?? '',
      PostalCode: json['PostalCode'] as String?,
      CreateDTimeUTC: json['CreateDTimeUTC'] as String? ?? '',
      CreateBy: json['CreateBy'] as String? ?? '',
      FlagActive: json['FlagActive'] as String? ?? '',
      Remark: json['Remark'] as String?,
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
      Lst_CustomerEmail: _convertToList(json['Lst_CustomerEmail']),
      Lst_CustomerPhoneNo: _convertToList(json['Lst_CustomerPhoneNo']),
      Lst_ZaloUserFollowerId: _convertToList(json['Lst_ZaloUserFollowerId']),
      Lst_ZaloUserID: _convertToList(json['Lst_ZaloUserID']),
    );
  }
  static List<String> _convertToList(dynamic value) {
    if (value is List) {
      return List<String>.from(value.map((item) => item?.toString() ?? ''));
    }
    return [];
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': OrgID,
      'CustomerCodeSys': CustomerCodeSys,
      'TicketID': TicketID,
      'NetworkID': NetworkID,
      'CustomerCode': CustomerCode,
      'CustomerName': CustomerName,
      'CustomerPhoneNo': CustomerPhoneNo,
      'CustomerEmail': CustomerEmail,
      'ZaloUserFollowerId': ZaloUserFollowerId,
      'ZaloUserID': ZaloUserID,
      'CustomerAvatarPath': CustomerAvatarPath,
      'PartnerType': PartnerType,
      'CustomerType': CustomerType,
      'CustomerGender': CustomerGender,
      'CustomerDateOfBirth': CustomerDateOfBirth,
      'CustomerPosition': CustomerPosition,
      'CustomerCompany': CustomerCompany,
      'CustomerGrpCode': CustomerGrpCode,
      'CustomerSourceCode': CustomerSourceCode,
      'NationCode': NationCode,
      'ProvinceCode': ProvinceCode,
      'DistrictCode': DistrictCode,
      'WardCode': WardCode,
      'AreaCode': AreaCode,
      'CustomerAddress': CustomerAddress,
      'PostalCode': PostalCode,
      'CreateDTimeUTC': CreateDTimeUTC,
      'CreateBy': CreateBy,
      'FlagActive': FlagActive,
      'Remark': Remark,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
      'Lst_CustomerEmail': Lst_CustomerEmail,
      'Lst_CustomerPhoneNo': Lst_CustomerPhoneNo,
      'Lst_ZaloUserFollowerId': Lst_ZaloUserFollowerId,
      'Lst_ZaloUserID': Lst_ZaloUserID,
    };
  }
}