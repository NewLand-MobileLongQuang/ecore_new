import 'package:equatable/equatable.dart';

class SKY_ETicket_MetaColGroup extends Equatable {
  SKY_ETicket_MetaColGroup(
      {required this.OrgID,
        required this.ETScrTplCodeSys,
        required this.NetworkID,
        required this.TicketColGrpCode,
        required this.ColGrpName,
        required this.OrderIdx,
        required this.LogLUDTimeUTC,
        required this.LogLUBy,
      });

  final String OrgID;
  final String ETScrTplCodeSys;
  final String NetworkID;
  final String TicketColGrpCode;
  final String ColGrpName;
  final int OrderIdx;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [OrgID, ETScrTplCodeSys, NetworkID, TicketColGrpCode, ColGrpName, OrderIdx, LogLUDTimeUTC, LogLUBy];
}