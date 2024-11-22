import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_agent.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_Lst_Agent extends Equatable {
  SKY_ETicket_Lst_Agent({required this.Sys_UserAutoAssignTicket,});

  final List<SKY_ETicket_Agent> Sys_UserAutoAssignTicket;

  @override
  List<Object?> get props => [
    Sys_UserAutoAssignTicket,
  ];
}
