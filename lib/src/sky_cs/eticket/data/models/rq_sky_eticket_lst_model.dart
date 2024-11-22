import 'package:ecore/src/sky_cs/eticket/data/models/rq_sky_eticket_follower_model.dart';
import 'package:ecore/src/sky_cs/eticket/data/models/rq_sky_eticket_model.dart';
import '../../domain/entities/rq_sky_eticket_lst.dart';

class RQ_SKY_eTicket_lst_Model extends RQ_SKY_eTicket_lst {
  RQ_SKY_eTicket_lst_Model({
    required super.ET_Ticket,
    required super.Lst_ET_TicketAttachFile,
    required super.Lst_ET_TicketFollower,
  });

  factory RQ_SKY_eTicket_lst_Model.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_eTicket_lst_Model(
      ET_Ticket: (json['ETScrTplCodeSys'] != null)
          ? RQ_SKY_eTicketModel.fromJson(json['ETScrTplCodeSys'] as Map<String, dynamic>)
          : null,
      Lst_ET_TicketAttachFile: (json['Lst_ET_TicketAttachFile'] as List<String>?)??[],
      Lst_ET_TicketFollower: (json['ETScrTplCodeSys'] as List<dynamic>?)
          ?.map((item) => RQ_SKY_eTicket_follower_Model.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ET_Ticket': ET_Ticket,
      'Lst_ET_TicketAttachFile': Lst_ET_TicketAttachFile,
      'Lst_ET_TicketFollower': Lst_ET_TicketFollower,
    };
  }
}