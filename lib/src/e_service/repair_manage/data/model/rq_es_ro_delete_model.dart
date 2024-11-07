
import '../../domain/entities/rq_es_ro_delete.dart';
import 'es_ro_delete_model.dart';

class RQ_ES_RODeleteModel extends RQ_ES_RODelete {
  RQ_ES_RODeleteModel({required super.es_RODelete});

  factory RQ_ES_RODeleteModel.fromJson(Map<String, dynamic> json) {
    return RQ_ES_RODeleteModel(
      es_RODelete: json['ES_RO'] as ES_RODeleteModel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ES_RO': es_RODelete,
    };
  }
}