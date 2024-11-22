import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_ticket_type_model.dart';
import '../../domain/entities/sky_eticket_get_lst_tickettype.dart';

class SKY_ETicket_Lst_Type_Model extends SKY_ETicket_Lst_TicketType {
  SKY_ETicket_Lst_Type_Model({required super.Lst_Mst_TicketType});

  factory SKY_ETicket_Lst_Type_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_Type_Model(
      Lst_Mst_TicketType: (json['Lst_Mst_TicketType'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_Type_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_TicketType': super.Lst_Mst_TicketType,
    };
  }
}