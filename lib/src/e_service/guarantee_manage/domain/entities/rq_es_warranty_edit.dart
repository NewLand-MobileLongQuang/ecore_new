import 'package:equatable/equatable.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_edit.dart';

class RQ_ES_WarrantyEdit extends Equatable{
  RQ_ES_WarrantyEdit({required this.es_WarrantyEdit, required this.Lst_ES_WarrantyAttachFile});

  final ES_WarrantyEdit es_WarrantyEdit;
  final List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile;

  @override
  List<Object?> get props => [es_WarrantyEdit, Lst_ES_WarrantyAttachFile];

}

