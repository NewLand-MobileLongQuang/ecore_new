import '../../domain/entities/sky_eticket_column_group.dart';

class SKY_ETicket_MetaColGroup_Model extends SKY_ETicket_MetaColGroup {
  SKY_ETicket_MetaColGroup_Model(
      {required super.OrgID,
        required super.ETScrTplCodeSys,
        required super.NetworkID,
        required super.TicketColGrpCode,
        required super.ColGrpName,
        required super.OrderIdx,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
      });

  factory SKY_ETicket_MetaColGroup_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_MetaColGroup_Model(
      OrgID: json['OrgID']?.toString() ?? '',
      ETScrTplCodeSys: json['ETScrTplCodeSys']?.toString() ?? '',
      NetworkID: json['NetworkID']?.toString() ?? '',
      TicketColGrpCode: json['TicketColGrpCode']?.toString() ?? '',
      ColGrpName: json['ColGrpName']?.toString() ?? '',
      OrderIdx: json['OrderIdx'] is int ? json['OrderIdx'] as int : 0,
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': super.OrgID,
      'ETScrTplCodeSys': super.ETScrTplCodeSys,
      'NetworkID': super.NetworkID,
      'TicketColGrpCode': super.TicketColGrpCode,
      'ColGrpName': super.ColGrpName,
      'OrderIdx': super.OrderIdx,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
    };
  }
}