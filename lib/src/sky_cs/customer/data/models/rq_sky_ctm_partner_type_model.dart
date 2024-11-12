

import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_ctm_partner_type.dart';

class RQ_SKY_CtmPartnerTypeModel extends RQ_SKY_CtmPartnerType {
  RQ_SKY_CtmPartnerTypeModel({required super.OrgID, required super.PartnerType});

  factory RQ_SKY_CtmPartnerTypeModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_CtmPartnerTypeModel(
      OrgID: json['OrgID'] as String? ?? '',
      PartnerType: json['PartnerType'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': super.OrgID,
      'PartnerType': super.PartnerType,
    };
  }
}