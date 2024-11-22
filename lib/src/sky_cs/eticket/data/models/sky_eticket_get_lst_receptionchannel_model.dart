import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_receptionchannell_model.dart';
import '../../domain/entities/sky_eticket_get_lst_receptionchannel.dart';

class SKY_ETicket_Lst_ReceptionChannel_Model extends SKY_ETicket_Lst_ReceptionChannel {
  SKY_ETicket_Lst_ReceptionChannel_Model({required super.Lst_Mst_ReceptionChannel});

  factory SKY_ETicket_Lst_ReceptionChannel_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_ReceptionChannel_Model(
      Lst_Mst_ReceptionChannel: (json['Lst_Mst_ReceptionChannel'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_ReceptionChannel_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_ReceptionChannel': super.Lst_Mst_ReceptionChannel,
    };
  }
}