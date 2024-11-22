import 'package:equatable/equatable.dart';

class RQ_SKY_eTicket extends Equatable {
  RQ_SKY_eTicket({
    required this.ETScrTplCodeSys,
    required this.TicketStatus,
    required this.OrgID,
    required this.CustomerCodeSys,
    required this.TicketName,
    required this.TicketDetail,
    required this.AgentCode,
    required this.DepartmentCode,
    required this.TicketType,
    required this.TicketPhoneNo,
    required this.TicketDeadline,
    required this.TicketPriority,
    required this.TicketJsonInfo,
    required this.ReceptionDTimeUTC,
    required this.TicketCustomType,
    required this.TicketSource,
    required this.ReceptionChannel,
    required this.ContactChannel,
    required this.Tags,
    required this.RemindWork,
    });

  final String ETScrTplCodeSys;
  final String TicketStatus;
  final String OrgID;
  final String CustomerCodeSys;
  final String TicketName;
  final String TicketDetail;
  final String AgentCode;
  final String DepartmentCode;
  final String TicketType;
  final String TicketPhoneNo;
  final String TicketDeadline;
  final String TicketPriority;
  final String TicketJsonInfo;
  final String ReceptionDTimeUTC;
  final String TicketCustomType;
  final String TicketSource;
  final String ReceptionChannel;
  final String ContactChannel;
  final String Tags;
  final String RemindWork;

  @override
  List<Object?> get props => [
    ETScrTplCodeSys,
    TicketStatus,
    OrgID,
    CustomerCodeSys,
    TicketName,
    TicketDetail,
    AgentCode,
    DepartmentCode,
    TicketType,
    TicketPhoneNo,
    TicketDeadline,
    TicketPriority,
    TicketJsonInfo,
    ReceptionDTimeUTC,
    TicketCustomType,
    TicketSource,
    ReceptionChannel,
    ContactChannel,
    Tags,
    RemindWork,
  ];
}