import '../../domain/entities/sky_eticket_get_message.dart';

class SKY_TicketMessageModel extends SKY_TicketMessage {
  SKY_TicketMessageModel({
    required super.AutoId,
    required super.TicketID,
    required super.OrgID,
    required super.NetworkID,
    required super.ConvMessageType,
    required super.ObjectId,
    required super.ObjectParentId,
    required super.PageId,
    required super.ObjectSenderId,
    required super.ObjectReceiveId,
    required super.UserId,
    required super.ChannelId,
    required super.Description,
    required super.Detail,
    required super.IsIncoming,
    required super.Status,
    required super.MsgDTime,
    required super.AttachmentDetails,
    required super.IsPin,
    required super.CreateDTimeUTC,
    required super.CreateBy,
    required super.LUDTimeUTC,
    required super.LUBy,
    required super.LogLUDTimeUTC,
    required super.LogLUBy,
    required super.AgentName,
    required super.Lst_ET_TicketAttachFile,
  });

  factory SKY_TicketMessageModel.fromJson(Map<String, dynamic> json) {
    return SKY_TicketMessageModel(
      AutoId: json['AutoId'] as int,
      TicketID: json['TicketID'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      ConvMessageType: json['ConvMessageType'] as String? ?? '',
      ObjectId: json['ObjectId']as String? ?? '',
      ObjectParentId: json['ObjectParentId']as String? ?? '',
      PageId: json['PageId'] as String? ?? '',
      ObjectSenderId: json['ObjectSenderId']as String? ?? '',
      ObjectReceiveId: json['ObjectReceiveId']as String? ?? '',
      UserId: json['UserId'] as String? ?? '',
      ChannelId: json['ChannelId'] as String? ?? '',
      Description: json['Description'] as String? ?? '',
      Detail: json['Detail']as String? ?? '',
      IsIncoming: json['IsIncoming'] as String? ?? '',
      Status: json['Status'] as String? ?? '',
      MsgDTime: json['MsgDTime'] as String? ?? '',
      AttachmentDetails: json['AttachmentDetails']as String? ?? '',
      IsPin: json['IsPin'] as String? ?? '',
      CreateDTimeUTC: json['CreateDTimeUTC'] as String? ?? '',
      CreateBy: json['CreateBy'] as String? ?? '',
      LUDTimeUTC: json['LUDTimeUTC'] as String? ?? '',
      LUBy: json['LUBy'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
      AgentName: json['AgentName'] as String? ?? '',
      Lst_ET_TicketAttachFile: _convertToList(json['Lst_ET_TicketAttachFile']),
    );
  }

  static List<dynamic> _convertToList(dynamic value) {
    if (value is List) {
      return List.from(value);
    }
    return []; // Return an empty list if it's not a list or is null
  }

  Map<String, dynamic> toJson() {
    return {
      'AutoId': AutoId,
      'TicketID': TicketID,
      'OrgID': OrgID,
      'NetworkID': NetworkID,
      'ConvMessageType': ConvMessageType,
      'ObjectId': ObjectId,
      'ObjectParentId': ObjectParentId,
      'PageId': PageId,
      'ObjectSenderId': ObjectSenderId,
      'ObjectReceiveId': ObjectReceiveId,
      'UserId': UserId,
      'ChannelId': ChannelId,
      'Description': Description,
      'Detail': Detail,
      'IsIncoming': IsIncoming,
      'Status': Status,
      'MsgDTime': MsgDTime,
      'AttachmentDetails': AttachmentDetails,
      'IsPin': IsPin,
      'CreateDTimeUTC': CreateDTimeUTC,
      'CreateBy': CreateBy,
      'LUDTimeUTC': LUDTimeUTC,
      'LUBy': LUBy,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
      'AgentName': AgentName,
      'Lst_ET_TicketAttachFile': Lst_ET_TicketAttachFile,
    };
  }
}
