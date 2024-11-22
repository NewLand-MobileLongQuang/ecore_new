import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_agent_model.dart';
import '../../domain/entities/sky_eticket_get_lst_agent.dart';

class SKY_ETicket_Lst_Agent_Model extends SKY_ETicket_Lst_Agent {
  SKY_ETicket_Lst_Agent_Model({required super.Sys_UserAutoAssignTicket});

  factory SKY_ETicket_Lst_Agent_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_Agent_Model(
      Sys_UserAutoAssignTicket: (json['Sys_UserAutoAssignTicket'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_Agent_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Sys_UserAutoAssignTicket': super.Sys_UserAutoAssignTicket,
    };
  }
}