

import '../../domain/entities/es_ro_attach_file.dart';

class ES_ROAttachFileModel extends ES_ROAttachFile {
  ES_ROAttachFileModel({required super.Idx, required super.FileName, required super.FilePath, required super.FileType, required super.FileSize, required super.ROAttachFileType});

  factory ES_ROAttachFileModel.fromMap(Map<String, dynamic> json) {
    return ES_ROAttachFileModel(
      Idx: json['Idx'] as int? ?? 0,
      FileName: json['FileName'] as String? ?? '',
      FilePath: json['FilePath'] as String? ?? '',
      FileType: json['FileType'] as String? ?? '',
      FileSize: json['FileSize'] as String? ?? '',
      ROAttachFileType: json['ROAttachFileType'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Idx': Idx,
      'FileName': FileName,
      'FilePath': FilePath,
      'FileType': FileType,
      'FileSize': FileSize,
      'ROAttachFileType': ROAttachFileType,
    };
  }
}