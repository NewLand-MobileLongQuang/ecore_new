
import '../../domain/entities/rq_es_ro_edit.dart';
import 'es_ro_attach_file_model.dart';
import 'es_ro_component_model.dart';
import 'es_ro_edit_model.dart';

class RQ_ES_ROEditModel extends RQ_ES_ROEdit {
  RQ_ES_ROEditModel({required super.es_ROEdit, required super.Lst_ES_ROComponent, required super.Lst_ES_ROAttachFile});

  factory RQ_ES_ROEditModel.fromJson(Map<String, dynamic> json) {
    return RQ_ES_ROEditModel(
      es_ROEdit: json['ES_RO'] as ES_ROEditModel,
      Lst_ES_ROComponent: json['Lst_ES_ROComponent'] as List<
          ES_ROComponentModel>,
      Lst_ES_ROAttachFile: json['Lst_ES_ROAttachFile'] as List<
          ES_ROAttachFileModel>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ES_RO': es_ROEdit,
      'Lst_ES_ROComponent': Lst_ES_ROComponent,
      'Lst_ES_ROAttachFile': Lst_ES_ROAttachFile,
    };
  }
}