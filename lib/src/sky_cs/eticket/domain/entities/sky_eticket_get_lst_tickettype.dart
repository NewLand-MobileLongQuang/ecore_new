import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_ticket_type.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_Lst_TicketType extends Equatable {
  SKY_ETicket_Lst_TicketType({required this.Lst_Mst_TicketType,});

  final List<SKY_ETicket_Type> Lst_Mst_TicketType;

  @override
  List<Object?> get props => [
    Lst_Mst_TicketType,
  ];
}
