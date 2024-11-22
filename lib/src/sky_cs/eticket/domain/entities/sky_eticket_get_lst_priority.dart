import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_priority.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_Lst_Priority extends Equatable {
  SKY_ETicket_Lst_Priority({required this.Lst_Mst_Priority,});

  final List<SKY_ETicket_Priority> Lst_Mst_Priority;

  @override
  List<Object?> get props => [
    Lst_Mst_Priority,
  ];
}
