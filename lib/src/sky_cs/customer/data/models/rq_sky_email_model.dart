import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_email.dart';

class RQ_SKY_EmailModel extends RQ_SKY_Email {
  RQ_SKY_EmailModel({required super.OrgID, required super.CustomerCodeSys, required super.CtmEmail, required super.FlagDefault});

  factory RQ_SKY_EmailModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_EmailModel(
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CtmEmail: json['CtmEmail'] as String? ?? '',
      FlagDefault: json['FlagDefault'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': super.OrgID,
      'CustomerCodeSys': super.CustomerCodeSys,
      'CtmEmail': super.CtmEmail,
      'FlagDefault': super.FlagDefault,
    };
  }
}