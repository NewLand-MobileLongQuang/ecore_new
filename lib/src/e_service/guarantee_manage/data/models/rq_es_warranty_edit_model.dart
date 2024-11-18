import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_attach_file_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_edit_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rq_es_warranty_edit.dart';

class RQ_ES_WarrantyEditModel extends RQ_ES_WarrantyEdit{
  RQ_ES_WarrantyEditModel({required super.es_WarrantyEdit, required super.Lst_ES_WarrantyAttachFile});

  factory RQ_ES_WarrantyEditModel.fromMap(Map<String, dynamic> json) {
    return RQ_ES_WarrantyEditModel(
      es_WarrantyEdit: json['ES_Warranty'] as ES_WarrantyEditModel,
      Lst_ES_WarrantyAttachFile: json['Lst_ES_WarrantyAttachFile'] as List<ES_WarrantyAttachFileModel>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ES_Warranty': es_WarrantyEdit,
      'Lst_ES_WarrantyAttachFile': Lst_ES_WarrantyAttachFile,
    };
  }
}