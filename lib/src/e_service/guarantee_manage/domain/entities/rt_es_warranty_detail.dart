import 'package:equatable/equatable.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';

class RT_ES_WarrantyDetail extends Equatable {
  RT_ES_WarrantyDetail({required this.Lst_ES_WarrantyDetail, required this.Lst_ES_WarrantyAttachFile});


  final List<ES_WarrantyDetail> Lst_ES_WarrantyDetail;
  final List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile;

  @override
  List<Object?> get props => [Lst_ES_WarrantyDetail, Lst_ES_WarrantyAttachFile];
}