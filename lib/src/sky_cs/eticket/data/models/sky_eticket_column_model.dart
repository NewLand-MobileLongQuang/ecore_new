import '../../domain/entities/sky_eticket_column_sec.dart';

class SKY_ETicket_Column_Model extends SKY_ETicket_MetaColGroupSpec {
  SKY_ETicket_Column_Model(
      {required super.OrgID,
        required super.ETScrTplCodeSys,
        required super.TicketColGrpCode,
        required super.TicketColCfgCodeSys,
        required super.NetworkID,
        required super.ColOperatorType,
        required super.OrderIdx,
        required super.ColWidth,
        required super.JsonRenderParams,
        required super.JsonListOption,
        required super.FlagIsNotNull,
        required super.FlagIsCheckDuplicate,
        required super.FlagIsQuery,
        required super.LogLUDTimeUTC,
        required super.LogLUBy,
        required super.ColCode,
        required super.ColCaption,
        required super.ColDataType,
        required super.FlagIsColDynamic,
      });

  factory SKY_ETicket_Column_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_Column_Model(
      OrgID: json['OrgID']?.toString() ?? '',
      ETScrTplCodeSys: json['ETScrTplCodeSys']?.toString() ?? '',
      TicketColGrpCode: json['TicketColGrpCode']?.toString() ?? '',
      TicketColCfgCodeSys: json['TicketColCfgCodeSys']?.toString() ?? '',
      NetworkID: json['NetworkID']?.toString() ?? '',
      ColOperatorType: json['ColOperatorType']?.toString() ?? '',
      OrderIdx: json['OrderIdx'] is int ? json['OrderIdx'] as int : 0,
      ColWidth: json['ColWidth'] is int ? json['ColWidth'] as int : 0,
      JsonRenderParams: json['JsonRenderParams']?.toString() ?? '',
      JsonListOption: json['JsonListOption']?.toString() ?? '',
      FlagIsNotNull: json['FlagIsNotNull']?.toString() ?? '',
      FlagIsCheckDuplicate: json['FlagIsCheckDuplicate']?.toString() ?? '',
      FlagIsQuery: json['FlagIsQuery']?.toString() ?? '',
      ColCaption: json['ColCaption']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      ColCode: json['ColCode']?.toString() ?? '',
      ColDataType: json['ColDataType']?.toString() ?? '',
      FlagIsColDynamic: json['FlagIsColDynamic']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': super.OrgID,
      'ETScrTplCodeSys': super.ETScrTplCodeSys,
      'TicketColGrpCode': super.TicketColGrpCode,
      'TicketColCfgCodeSys': super.TicketColCfgCodeSys,
      'NetworkID': super.NetworkID,
      'ColOperatorType': super.ColOperatorType,
      'OrderIdx': super.OrderIdx,
      'ColWidth': super.ColWidth,
      'JsonRenderParams': super.JsonRenderParams,
      'JsonListOption': super.JsonListOption,
      'FlagIsNotNull': super.FlagIsNotNull,
      'FlagIsCheckDuplicate': super.FlagIsCheckDuplicate,
      'FlagIsQuery': super.FlagIsQuery,
      'ColCode': super.ColCode,
      'ColCaption': super.ColCaption,
      'ColDataType': super.ColDataType,
      'FlagIsColDynamic': super.FlagIsColDynamic,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
    };
  }
}