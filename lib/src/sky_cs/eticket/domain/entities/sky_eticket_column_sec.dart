import 'package:equatable/equatable.dart';

class SKY_ETicket_MetaColGroupSpec extends Equatable {
  SKY_ETicket_MetaColGroupSpec(
      {required this.OrgID,
        required this.ETScrTplCodeSys,
        required this.TicketColGrpCode,
        required this.TicketColCfgCodeSys,
        required this.NetworkID,
        required this.ColOperatorType,
        required this.OrderIdx,
        required this.ColWidth,
        required this.JsonRenderParams,
        required this.JsonListOption,
        required this.FlagIsNotNull,
        required this.FlagIsCheckDuplicate,
        required this.FlagIsQuery,
        required this.LogLUDTimeUTC,
        required this.LogLUBy,
        required this.ColCode,
        required this.ColCaption,
        required this.ColDataType,
        required this.FlagIsColDynamic,
      });

  final String OrgID;
  final String ETScrTplCodeSys;
  final String TicketColGrpCode;
  final String TicketColCfgCodeSys;
  final String NetworkID;
  final String ColOperatorType;
  final int OrderIdx;
  final int ColWidth;
  final String JsonRenderParams;
  final String JsonListOption;
  final String FlagIsNotNull;
  final String FlagIsCheckDuplicate;
  final String FlagIsQuery;
  final String LogLUDTimeUTC;
  final String ColCode;
  final String ColCaption;
  final String ColDataType;
  final String FlagIsColDynamic;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    ETScrTplCodeSys,
    TicketColGrpCode,
    TicketColCfgCodeSys,
    NetworkID,
    ColOperatorType,
    OrderIdx,
    ColWidth,
    JsonRenderParams,
    JsonListOption,
    FlagIsNotNull,
    FlagIsCheckDuplicate,
    FlagIsQuery,
    LogLUDTimeUTC,
    ColCode,
    ColCaption,
    ColDataType,
    FlagIsColDynamic,
    LogLUBy,];
}