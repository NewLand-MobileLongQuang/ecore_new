

import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_ctm_group.dart';

class RQ_SKY_CtmGroupModel extends RQ_SKY_CtmGroup {
  RQ_SKY_CtmGroupModel({required super.OrgID, required super.CustomerCodeSys, required super.CustomerGrpCode});

  factory RQ_SKY_CtmGroupModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_CtmGroupModel(
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CustomerGrpCode: json['CustomerGrpCode'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': super.OrgID,
      'CustomerCodeSys': super.CustomerCodeSys,
      'CustomerGrpCode': super.CustomerGrpCode,
    };
  }
}