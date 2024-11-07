import 'package:equatable/equatable.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_delete.dart';

class RQ_ES_WarrantyDelete extends Equatable{
  RQ_ES_WarrantyDelete({required this.es_WarrantyDelete});

  final ES_WarrantyDelete es_WarrantyDelete;

  @override
  List<Object?> get props => [es_WarrantyDelete];

}