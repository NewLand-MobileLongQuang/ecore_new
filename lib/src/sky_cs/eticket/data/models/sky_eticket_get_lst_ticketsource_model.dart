import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_ticket_source_model.dart';
import '../../domain/entities/sky_eticket_get_lst_ticketsource.dart';

class SKY_ETicket_Lst_TicketSource_Model extends SKY_ETicket_Lst_TicketSource {
  SKY_ETicket_Lst_TicketSource_Model({required super.Lst_Mst_TicketSource});

  factory SKY_ETicket_Lst_TicketSource_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_TicketSource_Model(
      Lst_Mst_TicketSource: (json['Lst_Mst_TicketSource'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_TicketSource_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_TicketSource': super.Lst_Mst_TicketSource,
    };
  }
}