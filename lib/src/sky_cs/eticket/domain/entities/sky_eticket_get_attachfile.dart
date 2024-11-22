import 'package:equatable/equatable.dart';

class SKY_TicketAttachFile extends Equatable {
  SKY_TicketAttachFile({
    required this.TicketID,
    required this.OrgID,
    required this.Idx,
    required this.NetworkID,
    required this.FileName,
    required this.FilePath,
    required this.FileType,
    required this.FileSize,
    required this.MessageAutoId,
    required this.UploadDTimeUTC,
    required this.UploadBy,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  final String TicketID;
  final String OrgID;
  final int Idx;
  final String NetworkID;
  final String FileName;
  final String FilePath;
  final String FileType;
  final double FileSize;
  final String MessageAutoId;
  final String UploadDTimeUTC;
  final String UploadBy;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    TicketID,
    OrgID,
    Idx,
    NetworkID,
    FileName,
    FilePath,
    FileType,
    FileSize,
    MessageAutoId,
    UploadDTimeUTC,
    UploadBy,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}
