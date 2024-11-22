import 'package:equatable/equatable.dart';

class SKY_TicketMessagePin extends Equatable {
  SKY_TicketMessagePin({
    required this.AutoId,
    required this.TicketID,
    required this.OrgID,
    required this.NetworkID,
    required this.ConvMessageType,
    required this.ObjectId,
    required this.ObjectParentId,
    required this.PageId,
    required this.ObjectSenderId,
    required this.ObjectReceiveId,
    required this.UserId,
    required this.ChannelId,
    required this.Description,
    required this.Detail,
    required this.IsIncoming,
    required this.Status,
    required this.MsgDTime,
    required this.AttachmentDetails,
    required this.IsPin,
    required this.CreateDTimeUTC,
    required this.CreateBy,
    required this.LUDTimeUTC,
    required this.LUBy,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
    required this.AgentName,
    required this.Lst_ET_TicketAttachFile,
  });

  final int AutoId;
  final String TicketID;
  final String OrgID;
  final String NetworkID;
  final String ConvMessageType;
  final String? ObjectId;
  final String? ObjectParentId;
  final String PageId;
  final String? ObjectSenderId;
  final String? ObjectReceiveId;
  final String UserId;
  final String ChannelId;
  final String Description;
  final String? Detail;
  final String IsIncoming;
  final String Status;
  final String MsgDTime;
  final String? AttachmentDetails;
  final String IsPin;
  final String CreateDTimeUTC;
  final String CreateBy;
  final String LUDTimeUTC;
  final String LUBy;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String AgentName;
  final List<dynamic>? Lst_ET_TicketAttachFile; // Optional, refine if specific model exists

  @override
  List<Object?> get props => [
    AutoId,
    TicketID,
    OrgID,
    NetworkID,
    ConvMessageType,
    ObjectId,
    ObjectParentId,
    PageId,
    ObjectSenderId,
    ObjectReceiveId,
    UserId,
    ChannelId,
    Description,
    Detail,
    IsIncoming,
    Status,
    MsgDTime,
    AttachmentDetails,
    IsPin,
    CreateDTimeUTC,
    CreateBy,
    LUDTimeUTC,
    LUBy,
    LogLUDTimeUTC,
    LogLUBy,
    AgentName,
    Lst_ET_TicketAttachFile,
  ];
}
