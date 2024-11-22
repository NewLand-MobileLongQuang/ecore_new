import 'package:ecore/src/sky_cs/eticket/data/models/rq_sky_eticket_merge_lst_model.dart';

import '../../domain/entities/rq_sky_eticket_merge.dart';

class RQ_SKY_eTicket_Merge_Model extends RQ_SKY_eTicket_merge {
  RQ_SKY_eTicket_Merge_Model({
   required super.TicketID,
    required super.OrgID,
    required super.Lst_ET_Ticket});

  factory RQ_SKY_eTicket_Merge_Model.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_eTicket_Merge_Model(
      TicketID: json['TicketID'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      Lst_ET_Ticket: (json['Lst_ET_Ticket'] as List<dynamic>?)
          ?.map((item) => RQ_SKY_eTicket_Merge_lst_Model.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TicketID': TicketID,
      'OrgID': OrgID,
      'Lst_ET_Ticket': Lst_ET_Ticket,
    };
  }
}