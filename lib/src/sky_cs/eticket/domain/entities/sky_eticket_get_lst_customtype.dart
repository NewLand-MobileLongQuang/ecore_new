import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_custom_type.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_Lst_TicketCustomType extends Equatable {
  SKY_ETicket_Lst_TicketCustomType({required this.Lst_Mst_TicketCustomType,});

  final List<SKY_ETicket_CustomType> Lst_Mst_TicketCustomType;

  @override
  List<Object?> get props => [
    Lst_Mst_TicketCustomType,
  ];
}
