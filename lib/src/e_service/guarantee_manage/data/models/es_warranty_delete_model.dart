import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_delete.dart';

class ES_WarrantyDeleteModel extends ES_WarrantyDelete {
  ES_WarrantyDeleteModel({required super.WarrantyNo, required super.OrgID});

  factory ES_WarrantyDeleteModel.fromJson(Map<String, dynamic> json) {
    return ES_WarrantyDeleteModel(
      WarrantyNo: json['WarrantyNo'] as String ?? '',
      OrgID: json['OrgID'] as String ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'WarrantyNo': WarrantyNo,
      'OrgID': OrgID,
    };
  }
}