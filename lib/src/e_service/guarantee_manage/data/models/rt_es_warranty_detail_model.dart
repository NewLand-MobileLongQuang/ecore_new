import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_attach_file_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_detail_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_detail.dart';

class RT_ES_WarrantyDetailModel extends RT_ES_WarrantyDetail {
  RT_ES_WarrantyDetailModel({required super.Lst_ES_WarrantyDetail, required super.Lst_ES_WarrantyAttachFile});

  factory RT_ES_WarrantyDetailModel.fromMap(Map<String, dynamic> json) {
    return RT_ES_WarrantyDetailModel(
      Lst_ES_WarrantyDetail: json['Lst_ES_Warranty'] != null
          ? (json['Lst_ES_Warranty'] as List).map((item) => ES_WarrantyDetailModel.fromMap(item as Map<String, dynamic>)).toList()
          : <ES_WarrantyDetailModel>[],
      Lst_ES_WarrantyAttachFile: json['Lst_ES_WarrantyAttachFile'] != null
          ? (json['Lst_ES_WarrantyAttachFile'] as List).map((item) => ES_WarrantyAttachFileModel.fromMap(item as Map<String, dynamic>)).toList()
          : <ES_WarrantyAttachFileModel>[],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_ES_WarrantyDetail': Lst_ES_WarrantyDetail,
      'Lst_ES_WarrantyAttachFile': Lst_ES_WarrantyAttachFile,
    };
  }
}