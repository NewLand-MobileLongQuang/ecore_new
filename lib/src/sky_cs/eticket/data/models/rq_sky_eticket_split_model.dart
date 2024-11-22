import 'package:ecore/src/sky_cs/eticket/data/models/rq_sky_eticket_split_lst_model.dart';
import '../../domain/entities/rq_sky_eticket_split.dart';

class RQ_SKY_eTicket_Split_Model extends RQ_SKY_eTicket_split {
  RQ_SKY_eTicket_Split_Model({
    required super.TicketID,
    required super.OrgID,
    required super.Lst_ET_TicketMessage});

  factory RQ_SKY_eTicket_Split_Model.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_eTicket_Split_Model(
      TicketID: json['TicketID'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      Lst_ET_TicketMessage: (json['Lst_ET_TicketMessage'] as List<dynamic>?)
          ?.map((item) => RQ_SKY_eTicket_Split_lst_Model.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TicketID': TicketID,
      'OrgID': OrgID,
      'Lst_ET_TicketMessage': Lst_ET_TicketMessage,
    };
  }
}