import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_receptionchannel.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_Lst_ReceptionChannel extends Equatable {
  SKY_ETicket_Lst_ReceptionChannel({required this.Lst_Mst_ReceptionChannel,});

  final List<SKY_ETicket_ReceptionChannel> Lst_Mst_ReceptionChannel;

  @override
  List<Object?> get props => [
    Lst_Mst_ReceptionChannel,
  ];
}
