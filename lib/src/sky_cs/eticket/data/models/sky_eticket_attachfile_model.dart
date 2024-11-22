import '../../domain/entities/sky_eticket_get_attachfile.dart';

class SKY_TicketAttachFileModel extends SKY_TicketAttachFile {
  SKY_TicketAttachFileModel({
    required super.TicketID,
    required super.OrgID,
    required super.Idx,
    required super.NetworkID,
    required super.FileName,
    required super.FilePath,
    required super.FileType,
    required super.FileSize,
    required super.MessageAutoId,
    required super.UploadDTimeUTC,
    required super.UploadBy,
    required super.LogLUDTimeUTC,
    required super.LogLUBy,
  });

  factory SKY_TicketAttachFileModel.fromJson(Map<String, dynamic> json) {
    return SKY_TicketAttachFileModel(
      TicketID: json['TicketID'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      Idx: json['Idx'] as int? ?? 0,
      NetworkID: json['NetworkID'] as String? ?? '',
      FileName: json['FileName'] as String? ?? '',
      FilePath: json['FilePath'] as String? ?? '',
      FileType: json['FileType'] as String? ?? '',
      FileSize: (json['FileSize'] as num?)?.toDouble() ?? 0.0,
      MessageAutoId: json['MessageAutoId'] as String? ?? '',
      UploadDTimeUTC: json['UploadDTimeUTC'] as String? ?? '',
      UploadBy: json['UploadBy'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TicketID': TicketID,
      'OrgID': OrgID,
      'Idx': Idx,
      'NetworkID': NetworkID,
      'FileName': FileName,
      'FilePath': FilePath,
      'FileType': FileType,
      'FileSize': FileSize,
      'MessageAutoId': MessageAutoId,
      'UploadDTimeUTC': UploadDTimeUTC,
      'UploadBy': UploadBy,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}
