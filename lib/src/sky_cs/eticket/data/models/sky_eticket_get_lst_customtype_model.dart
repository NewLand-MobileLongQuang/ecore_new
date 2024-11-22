import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_custom_type_model.dart';
import '../../domain/entities/sky_eticket_get_lst_customtype.dart';

class SKY_ETicket_Lst_CustomType_Model extends SKY_ETicket_Lst_TicketCustomType {
  SKY_ETicket_Lst_CustomType_Model({required super.Lst_Mst_TicketCustomType});

  factory SKY_ETicket_Lst_CustomType_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_CustomType_Model(
      Lst_Mst_TicketCustomType: (json['Lst_Mst_TicketCustomType'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_CustomType_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_TicketCustomType': super.Lst_Mst_TicketCustomType,
    };
  }
}