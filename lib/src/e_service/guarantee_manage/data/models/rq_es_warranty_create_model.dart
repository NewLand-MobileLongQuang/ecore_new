import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_attach_file_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_create_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rq_es_warranty_create.dart';

class RQ_ES_WarrantyCreateModel extends RQ_ES_WarrantyCreate {
  RQ_ES_WarrantyCreateModel({required super.es_WarrantyCreate, required super.Lst_ES_WarrantyAttachFile});

  factory RQ_ES_WarrantyCreateModel.fromJson(Map<String, dynamic> json) {
    return RQ_ES_WarrantyCreateModel(
      es_WarrantyCreate: json['ES_Warranty'] as ES_WarrantyCreateModel,
      Lst_ES_WarrantyAttachFile: json['Lst_ES_WarrantyAttachFile'] as List<ES_WarrantyAttachFileModel>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ES_Warranty': es_WarrantyCreate,
      'Lst_ES_WarrantyAttachFile': Lst_ES_WarrantyAttachFile,
    };
  }
}