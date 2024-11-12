import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_gov_id.dart';

class RQ_SKY_GovIDModel extends RQ_SKY_GovID {
  RQ_SKY_GovIDModel({required super.GovID, required super.GovIDDate, required super.GovIDType, required super.OrgID, required super.CustomerCodeSys});

  factory RQ_SKY_GovIDModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_GovIDModel(
      GovID: json['GovID'] as String? ?? '',
      GovIDDate: json['GovIDDate'] as String? ?? '',
      GovIDType: json['GovIDType'] as String? ?? '',
      OrgID: json['OrgID'] as int? ?? 0,
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'GovID': super.GovID,
      'GovIDDate': super.GovIDDate,
      'GovIDType': super.GovIDType,
      'OrgID': super.OrgID,
      'CustomerCodeSys': super.CustomerCodeSys,
    };
  }
}