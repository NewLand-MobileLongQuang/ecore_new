import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_priority_model.dart';
import '../../domain/entities/sky_eticket_get_lst_priority.dart';

class SKY_ETicket_Lst_Priority_Model extends SKY_ETicket_Lst_Priority {
  SKY_ETicket_Lst_Priority_Model({required super.Lst_Mst_Priority});

  factory SKY_ETicket_Lst_Priority_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_Priority_Model(
      Lst_Mst_Priority: (json['Lst_Mst_TicketPriority'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_Priority_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_Priority': super.Lst_Mst_Priority,
    };
  }
}