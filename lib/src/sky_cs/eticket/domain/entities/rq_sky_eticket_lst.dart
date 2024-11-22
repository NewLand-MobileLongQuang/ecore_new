import 'package:ecore/src/sky_cs/eticket/domain/entities/rq_sky_eticket.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/rq_sky_eticket_follower.dart';
import 'package:equatable/equatable.dart';

class RQ_SKY_eTicket_lst extends Equatable {
  RQ_SKY_eTicket_lst(
      {required this.ET_Ticket,
        required this.Lst_ET_TicketAttachFile,
        required this.Lst_ET_TicketFollower});

  final RQ_SKY_eTicket? ET_Ticket;
  final List<String> Lst_ET_TicketAttachFile;
  final List<RQ_SKY_eTicket_follower> Lst_ET_TicketFollower;

  @override
  List<Object?> get props => [
    ET_Ticket,
    Lst_ET_TicketAttachFile,
    Lst_ET_TicketFollower,
  ];
}