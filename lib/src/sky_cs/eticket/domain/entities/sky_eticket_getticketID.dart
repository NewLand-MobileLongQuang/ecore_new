import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_HO.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_follower_HO.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_attachfile.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_follower.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_message.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_messagepin.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_getcustomer.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_info.dart';
import 'package:equatable/equatable.dart';

class SKY_GetTicketID extends Equatable {
  SKY_GetTicketID(
      {required this.Lst_ET_Ticket,
        required this.Lst_ET_TicketAttachFile,
        required this.Lst_ET_TicketCustomer,
        required this.Lst_ET_TicketFollower,
        required this.Lst_ET_TicketMessage,
        required this.Lst_ET_TicketMessagePin,
        required this.Lst_ET_TicketHO,
        required this.Lst_ET_TicketFollowerHO,
        required this.c_K_DT_Sys,
      });

  final List<SKY_TicketInfo> Lst_ET_Ticket;
  final List<SKY_TicketAttachFile> Lst_ET_TicketAttachFile;
  final List<SKY_TicketCustomer> Lst_ET_TicketCustomer;
  final List<SKY_TicketFollower> Lst_ET_TicketFollower;
  final List<SKY_TicketMessage> Lst_ET_TicketMessage;
  final List<SKY_TicketMessagePin> Lst_ET_TicketMessagePin;
  final List<LstETTicketHO> Lst_ET_TicketHO;
  final List<LstETTicketFollowerHO> Lst_ET_TicketFollowerHO;
  final List<dynamic> c_K_DT_Sys;

  @override
  List<Object?> get props => [
    Lst_ET_Ticket,Lst_ET_TicketAttachFile,
    Lst_ET_TicketCustomer,Lst_ET_TicketFollower,
    Lst_ET_TicketMessage,Lst_ET_TicketMessagePin,
    Lst_ET_TicketHO,Lst_ET_TicketFollowerHO,c_K_DT_Sys];
}