import '../../domain/entities/rq_sky_eticket_lst_merge.dart';

class RQ_SKY_eTicket_Merge_lst_Model extends RQ_SKY_eTicket_lst_merge {
  RQ_SKY_eTicket_Merge_lst_Model({
    required super.TicketID});

  factory RQ_SKY_eTicket_Merge_lst_Model.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_eTicket_Merge_lst_Model(
      TicketID: json['TicketID'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TicketID': TicketID,
    };
  }
}