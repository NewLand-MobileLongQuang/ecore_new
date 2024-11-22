import 'package:ecore/src/sky_cs/eticket/domain/entities/rq_sky_eticket_lst_split.dart';
import 'package:equatable/equatable.dart';

class RQ_SKY_eTicket_split extends Equatable {
  RQ_SKY_eTicket_split(
      {required this.TicketID,
        required this.OrgID,
        required this.Lst_ET_TicketMessage});

  final String TicketID;
  final String OrgID;
  final List<RQ_SKY_eTicket_lst_split> Lst_ET_TicketMessage;

  @override
  List<Object?> get props => [
    TicketID,
    OrgID,
    Lst_ET_TicketMessage,
  ];
}