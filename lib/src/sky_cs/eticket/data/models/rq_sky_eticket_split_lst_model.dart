import '../../domain/entities/rq_sky_eticket_lst_split.dart';

class RQ_SKY_eTicket_Split_lst_Model extends RQ_SKY_eTicket_lst_split {
  RQ_SKY_eTicket_Split_lst_Model({
    required super.TicketID,
    required super.AutoID});

  factory RQ_SKY_eTicket_Split_lst_Model.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_eTicket_Split_lst_Model(
      TicketID: json['TicketID'] as String? ?? '',
      AutoID: json['AutoID'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TicketID': TicketID,
      'AutoID': AutoID,
    };
  }
}