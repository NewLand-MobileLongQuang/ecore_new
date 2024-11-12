

import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_customer_delete.dart';

class RQ_SKY_CustomerDeleteModel extends RQ_SKY_CustomerDelete {
  const RQ_SKY_CustomerDeleteModel({required super.OrgID, required super.CustomerCodeSys, required super.NetworkID});

  factory RQ_SKY_CustomerDeleteModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_CustomerDeleteModel(
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': OrgID,
      'CustomerCodeSys': CustomerCodeSys,
      'NetworkID': NetworkID,
    };
  }
}