import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_phone.dart';

class SKY_CustomerPhoneModel extends SKY_CustomerPhone {
  SKY_CustomerPhoneModel({required super.OrgID, required super.CustomerCodeSys, required super.CtmPhoneNo, required super.NetworkID, required super.FlagDefault, required super.FlagActive, required super.LogLUDTimeUTC, required super.LogLUBy});

  factory SKY_CustomerPhoneModel.fromMap(Map<String, dynamic> json) {
    return SKY_CustomerPhoneModel(
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CtmPhoneNo: json['CtmPhoneNo'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      FlagDefault: json['FlagDefault'] as String? ?? '',
      FlagActive: json['FlagActive'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': OrgID,
      'CustomerCodeSys': CustomerCodeSys,
      'CtmPhoneNo': CtmPhoneNo,
      'NetworkID': NetworkID,
      'FlagDefault': FlagDefault,
      'FlagActive': FlagActive,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}