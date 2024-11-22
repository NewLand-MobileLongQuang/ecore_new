import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_attachfile_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_customer_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_follower_HO_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_follower_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_HO_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_message_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_message_pin.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_info_model.dart';
import '../../domain/entities/sky_eticket_getticketID.dart';

class SKY_ETicketGetIDModel extends SKY_GetTicketID {
  SKY_ETicketGetIDModel({
    required super.Lst_ET_Ticket,
    required super.Lst_ET_TicketAttachFile,
    required super.Lst_ET_TicketCustomer,
    required super.Lst_ET_TicketFollower,
    required super.Lst_ET_TicketMessage,
    required super.Lst_ET_TicketMessagePin,
    required super.Lst_ET_TicketHO,
    required super.Lst_ET_TicketFollowerHO,
    required super.c_K_DT_Sys,
  });

  factory SKY_ETicketGetIDModel.fromJson(Map<String, dynamic> json) {
    return SKY_ETicketGetIDModel(
      Lst_ET_Ticket: json['Lst_ET_Ticket'] != null
          ? (json['Lst_ET_Ticket'] as List).map((item) => SKY_ETicketInfoModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_ETicketInfoModel>[],
      Lst_ET_TicketAttachFile: json['Lst_ET_TicketAttachFile'] != null
          ? (json['Lst_ET_TicketAttachFile'] as List).map((item) => SKY_TicketAttachFileModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_TicketAttachFileModel>[],
      Lst_ET_TicketCustomer: json['Lst_ET_TicketCustomer'] != null
          ? (json['Lst_ET_TicketCustomer'] as List).map((item) => SKY_TicketCustomerModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_TicketCustomerModel>[],
      Lst_ET_TicketFollower: json['Lst_ET_TicketFollower'] != null
          ? (json['Lst_ET_TicketFollower'] as List).map((item) => LstETTicketFollower.fromJson(item as Map<String, dynamic>)).toList()
          : <LstETTicketFollower>[],
      Lst_ET_TicketMessage: json['Lst_ET_TicketMessage'] != null
          ? (json['Lst_ET_TicketMessage'] as List).map((item) => SKY_TicketMessageModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_TicketMessageModel>[],
      Lst_ET_TicketMessagePin: json['Lst_ET_TicketMessagePin'] != null
          ? (json['Lst_ET_TicketMessagePin'] as List).map((item) => SKY_TicketMessagePinModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_TicketMessagePinModel>[],
      Lst_ET_TicketHO: json['Lst_ET_TicketHO'] != null
          ? (json['Lst_ET_TicketHO'] as List).map((item) => SKY_TicketHOModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_TicketHOModel>[],
      Lst_ET_TicketFollowerHO: json['Lst_ET_TicketFollowerHO'] != null
          ? (json['Lst_ET_TicketFollowerHO'] as List).map((item) => SKY_TicketFollowerHOModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_TicketFollowerHOModel>[],
      c_K_DT_Sys: json['c_K_DT_Sys'] != null
          ? (json['c_K_DT_Sys'] as List).map((item) => SKY_ETicketInfoModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_ETicketInfoModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Lst_ET_Ticket': Lst_ET_Ticket,
      'Lst_ET_TicketAttachFile': Lst_ET_TicketAttachFile,
      'Lst_ET_TicketCustomer': Lst_ET_TicketCustomer,
      'Lst_ET_TicketFollower': Lst_ET_TicketFollower,
      'Lst_ET_TicketMessage': Lst_ET_TicketMessage,
      'Lst_ET_TicketMessagePin': Lst_ET_TicketMessagePin,
      'Lst_ET_TicketHO': Lst_ET_TicketHO,
      'c_K_DT_Sys': c_K_DT_Sys,
    };
  }
}