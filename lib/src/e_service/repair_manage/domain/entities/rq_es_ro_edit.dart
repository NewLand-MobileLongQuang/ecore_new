import 'package:equatable/equatable.dart';

import 'es_ro_attach_file.dart';
import 'es_ro_component.dart';
import 'es_ro_edit.dart';

class RQ_ES_ROEdit extends Equatable{
  RQ_ES_ROEdit({required this.es_ROEdit, required this.Lst_ES_ROComponent, required this.Lst_ES_ROAttachFile});

  final ES_ROEdit es_ROEdit;
  final List<ES_ROComponent> Lst_ES_ROComponent;
  final List<ES_ROAttachFile> Lst_ES_ROAttachFile;

  @override
  List<Object?> get props => [es_ROEdit, Lst_ES_ROComponent, Lst_ES_ROAttachFile];
  
}