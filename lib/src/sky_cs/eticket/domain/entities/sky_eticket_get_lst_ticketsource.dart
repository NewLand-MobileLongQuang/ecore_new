import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_ticketsource.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_Lst_TicketSource extends Equatable {
  SKY_ETicket_Lst_TicketSource({required this.Lst_Mst_TicketSource,});

  final List<SKY_ETicket_TicketSource> Lst_Mst_TicketSource;

  @override
  List<Object?> get props => [
    Lst_Mst_TicketSource,
  ];
}
