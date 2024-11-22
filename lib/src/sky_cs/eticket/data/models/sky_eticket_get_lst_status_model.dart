import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_status_model.dart';
import '../../domain/entities/sky_eticket_get_lst_status.dart';

class SKY_ETicket_Lst_Status_Model extends SKY_ETicket_Lst_TicketStatus {
  SKY_ETicket_Lst_Status_Model({required super.Lst_Mst_TicketStatus});

  factory SKY_ETicket_Lst_Status_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_Status_Model(
      Lst_Mst_TicketStatus: (json['Lst_Mst_TicketStatus'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_Status_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_TicketStatus': super.Lst_Mst_TicketStatus,
    };
  }
}