import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_phone.dart';

class RQ_SKY_PhoneModel extends RQ_SKY_Phone {
  RQ_SKY_PhoneModel({required super.OrgID, required super.CustomerCodeSys, required super.CtmPhoneNo, required super.FlagDefault});

  factory RQ_SKY_PhoneModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_PhoneModel(
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CtmPhoneNo: json['CtmPhoneNo'] as String? ?? '',
      FlagDefault: json['FlagDefault'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': super.OrgID,
      'CustomerCodeSys': super.CustomerCodeSys,
      'CtmPhoneNo': super.CtmPhoneNo,
      'FlagDefault': super.FlagDefault,
    };
  }
}