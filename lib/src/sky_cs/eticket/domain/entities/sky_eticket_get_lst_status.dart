import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_status.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_Lst_TicketStatus extends Equatable {
  SKY_ETicket_Lst_TicketStatus({required this.Lst_Mst_TicketStatus,});

  final List<SKY_ETicket_Status> Lst_Mst_TicketStatus;

  @override
  List<Object?> get props => [
    Lst_Mst_TicketStatus,
  ];
}
