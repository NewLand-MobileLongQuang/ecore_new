import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rq_es_warranty_delete.dart';

class RQ_ES_WarrantyDeleteModel extends RQ_ES_WarrantyDelete {
   RQ_ES_WarrantyDeleteModel({required super.es_WarrantyDelete});

  factory RQ_ES_WarrantyDeleteModel.fromJson(Map<String, dynamic> json) {
    return RQ_ES_WarrantyDeleteModel(
      es_WarrantyDelete: json['ES_Warranty'] as ES_WarrantyDeleteModel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ES_Warranty': es_WarrantyDelete,
    };
  }
}