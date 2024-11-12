import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_contact.dart';

class SKY_CustomerContactModel extends SKY_CustomerContact {
  SKY_CustomerContactModel({required super.OrgID, required super.CustomerCodeSys, required super.CustomerCodeSysContact, required super.NetworkID, required super.FlagActive, required super.LogLUDTimeUTC, required super.LogLUBy, required super.mcc_CustomerCodeSys, required super.mcc_CustomerCode, required super.mcc_CustomerName, required super.mcc_CustomerNameEN, required super.mcc_CustomerAvatarName, required super.mcc_CustomerAvatarPath, required super.mcc_JsonCustomerInfo, required super.mcc_CustomerPhoneJson, required super.mcc_CustomerEmailJson});

  factory SKY_CustomerContactModel.fromMap(Map<String, dynamic> json) {
    return SKY_CustomerContactModel(
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CustomerCodeSysContact: json['CustomerCodeSysContact'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      FlagActive: json['FlagActive'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
      mcc_CustomerCodeSys: json['mcc_CustomerCodeSys'] as String? ?? '',
      mcc_CustomerCode: json['mcc_CustomerCode'] as String? ?? '',
      mcc_CustomerName: json['mcc_CustomerName'] as String? ?? '',
      mcc_CustomerNameEN: json['mcc_CustomerNameEN'] as String? ?? '',
      mcc_CustomerAvatarName: json['mcc_CustomerAvatarName'] as String? ?? '',
      mcc_CustomerAvatarPath: json['mcc_CustomerAvatarPath'] as String? ?? '',
      mcc_JsonCustomerInfo: json['mcc_JsonCustomerInfo'] as String? ?? '',
      mcc_CustomerPhoneJson: json['mcc_CustomerPhoneJson'] as String? ?? '',
      mcc_CustomerEmailJson: json['mcc_CustomerEmailJson'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': OrgID,
      'CustomerCodeSys': CustomerCodeSys,
      'CustomerCodeSysContact': CustomerCodeSysContact,
      'NetworkID': NetworkID,
      'FlagActive': FlagActive,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
      'mcc_CustomerCodeSys': mcc_CustomerCodeSys,
      'mcc_CustomerCode': mcc_CustomerCode,
      'mcc_CustomerName': mcc_CustomerName,
      'mcc_CustomerNameEN': mcc_CustomerNameEN,
      'mcc_CustomerAvatarName': mcc_CustomerAvatarName,
      'mcc_CustomerAvatarPath': mcc_CustomerAvatarPath,
      'mcc_JsonCustomerInfo': mcc_JsonCustomerInfo,
      'mcc_CustomerPhoneJson': mcc_CustomerPhoneJson,
      'mcc_CustomerEmailJson': mcc_CustomerEmailJson,
    };
  }
}