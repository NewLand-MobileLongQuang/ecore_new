import '../../domain/entities/rq_sky_eticket.dart';

class RQ_SKY_eTicketModel extends RQ_SKY_eTicket {
  RQ_SKY_eTicketModel({
    required super.ETScrTplCodeSys,
    required super.TicketStatus,
    required super.OrgID,
    required super.CustomerCodeSys,
    required super.TicketName,
    required super.TicketDetail,
    required super.AgentCode,
    required super.DepartmentCode,
    required super.TicketType,
    required super.TicketPhoneNo,
    required super.TicketDeadline,
    required super.TicketPriority,
    required super.TicketJsonInfo,
    required super.ReceptionDTimeUTC,
    required super.TicketCustomType,
    required super.TicketSource,
    required super.ReceptionChannel,
    required super.ContactChannel,
    required super.Tags,
    required super.RemindWork,
  });

  factory RQ_SKY_eTicketModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_eTicketModel(
      ETScrTplCodeSys: json['ETScrTplCodeSys'] as String? ?? '',
      TicketStatus: json['TicketStatus'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      TicketName: json['TicketName'] as String? ?? '',
      TicketDetail: json['TicketDetail'] as String? ?? '',
      AgentCode: json['AgentCode'] as String? ?? '',
      DepartmentCode: json['DepartmentCode'] as String? ?? '',
      TicketType: json['TicketType'] as String? ?? '',
      TicketPhoneNo: json['TicketPhoneNo'] as String? ?? '',
      TicketDeadline: json['TicketDeadline'] as String? ?? '',
      TicketPriority: json['TicketPriority'] as String? ?? '',
      TicketJsonInfo: json['TicketJsonInfo'] as String? ?? '',
      ReceptionDTimeUTC: json['ReceptionDTimeUTC'] as String? ?? '',
      TicketCustomType: json['TicketCustomType'] as String? ?? '',
      TicketSource: json['TicketSource'] as String? ?? '',
      ReceptionChannel: json['ReceptionChannel'] as String? ?? '',
      ContactChannel: json['ContactChannel'] as String? ?? '',
      Tags: json['Tags'] as String? ?? '',
      RemindWork: json['RemindWork'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ETScrTplCodeSys': ETScrTplCodeSys,
      'TicketStatus': TicketStatus,
      'OrgID': OrgID,
      'CustomerCodeSys': CustomerCodeSys,
      'TicketName': TicketName,
      'TicketDetail': TicketDetail,
      'AgentCode': AgentCode,
      'DepartmentCode': DepartmentCode,
      'TicketType': TicketType,
      'TicketPhoneNo': TicketPhoneNo,
      'TicketDeadline': TicketDeadline,
      'TicketPriority': TicketPriority,
      'TicketJsonInfo': TicketJsonInfo,
      'ReceptionDTimeUTC': ReceptionDTimeUTC,
      'TicketCustomType': TicketCustomType,
      'TicketSource': TicketSource,
      'ReceptionChannel': ReceptionChannel,
      'ContactChannel': ContactChannel,
      'Tags': Tags,
      'RemindWork': RemindWork,
    };
  }
}