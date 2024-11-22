import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_column_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_metagroup_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_template_model.dart';

import '../../domain/entities/sky_eticket_column.dart';


class SKY_ETicketTplCodesysModel extends SKY_ETicketColumn {
  SKY_ETicketTplCodesysModel({
    required super.Lst_ET_MetaScreenTemplate,
    required super.Lst_ET_MetaColGroup,
    required super.Lst_ET_MetaColGroupSpec});
  factory SKY_ETicketTplCodesysModel.fromJson(Map<String, dynamic> json)
 // factory SKY_ETicketTplCodesysModel.fromMap(Map<String, dynamic> json) {
  {
    return SKY_ETicketTplCodesysModel(
      Lst_ET_MetaScreenTemplate: (json['Lst_ET_MetaScreenTemplate'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_MetaScreenTemplate_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
      Lst_ET_MetaColGroup: (json['Lst_ET_MetaColGroup'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_MetaColGroup_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
      Lst_ET_MetaColGroupSpec: (json['Lst_ET_MetaColGroupSpec'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_Column_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_ET_MetaScreenTemplate': super.Lst_ET_MetaScreenTemplate,
      'Lst_ET_MetaColGroup': super.Lst_ET_MetaColGroup,
      'Lst_ET_MetaColGroupSpec': super.Lst_ET_MetaColGroupSpec,
    };
  }
}