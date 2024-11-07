import 'package:equatable/equatable.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_create.dart';

class RQ_ES_WarrantyCreate extends Equatable{
  RQ_ES_WarrantyCreate({required this.es_WarrantyCreate, required this.Lst_ES_WarrantyAttachFile});

  final ES_WarrantyCreate es_WarrantyCreate;
  final List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile;

  @override
  List<Object?> get props => [es_WarrantyCreate, Lst_ES_WarrantyAttachFile];

}