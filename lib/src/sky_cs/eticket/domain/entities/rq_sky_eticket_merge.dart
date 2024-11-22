import 'package:ecore/src/sky_cs/eticket/domain/entities/rq_sky_eticket_lst_merge.dart';
import 'package:equatable/equatable.dart';

class RQ_SKY_eTicket_merge extends Equatable {
  RQ_SKY_eTicket_merge(
      {required this.TicketID,
        required this.OrgID,
        required this.Lst_ET_Ticket});

  final String TicketID;
  final String OrgID;
  final List<RQ_SKY_eTicket_lst_merge> Lst_ET_Ticket;

  @override
  List<Object?> get props => [
    TicketID,
    OrgID,
    Lst_ET_Ticket,
  ];
}