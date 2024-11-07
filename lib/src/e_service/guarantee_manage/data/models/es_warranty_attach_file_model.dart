import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';

class ES_WarrantyAttachFileModel extends ES_WarrantyAttachFile {
  ES_WarrantyAttachFileModel({required super.Idx, required super.FileName, required super.FilePath, required super.FileType, required super.FileSize});

  factory ES_WarrantyAttachFileModel.fromJson(Map<String, dynamic> json) {
    return ES_WarrantyAttachFileModel(
      Idx: json['Idx'] as int? ?? 1,
      FileName: json['FileName'] as String? ?? '',
      FilePath: json['FilePath'] as String? ?? '',
      FileType: json['FileType'] as String? ?? '',
      FileSize: json['FileSize'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Idx': Idx,
      'FileName': FileName,
      'FilePath': FilePath,
      'FileType': FileType,
      'FileSize': FileSize,
    };
  }
}