import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_file_upload.dart';

class RT_ES_FileUploadModel extends RT_ES_FileUpload {
  RT_ES_FileUploadModel({required super.FileId, required super.NodeID, required super.NetworkID, required super.SolutionCode, required super.FileUrlLocal, required super.FileUrlFS, required super.FileFullName, required super.FileType, required super.FileSize, required super.FileContent, required super.RefNo, required super.RefType, required super.FileIdDelete, required super.CreateDTimeUTC, required super.CreateBy, required super.LUDTimeUTC, required super.LUBy, required super.UpdDTimeUTC, required super.UpdBy, required super.DeleteDTimeUTC, required super.DeleteBy, required super.FlagIsDeleted, required super.FlagIsRecycle, required super.LogLUDTimeUTC, required super.LogLUBy});

  factory RT_ES_FileUploadModel.fromMap(Map<String, dynamic> json) {
    return RT_ES_FileUploadModel(
      FileId: json['FileId'] as String? ?? '',
      NodeID: json['NodeID'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      SolutionCode: json['SolutionCode'] as String? ?? '',
      FileUrlLocal: json['FileUrlLocal'] as String? ?? '',
      FileUrlFS: json['FileUrlFS'] as String? ?? '',
      FileFullName: json['FileFullName'] as String? ?? '',
      FileType: json['FileType'] as String? ?? '',
      FileSize: json['FileSize'] as double? ?? 0.0,
      FileContent: json['FileContent'] as String? ?? '',
      RefNo: json['RefNo'] as String? ?? '',
      RefType: json['RefType'] as String? ?? '',
      FileIdDelete: json['FileIdDelete'] as String? ?? '',
      CreateDTimeUTC: json['CreateDTimeUTC'] as String? ?? '',
      CreateBy: json['CreateBy'] as String? ?? '',
      LUDTimeUTC: json['LUDTimeUTC'] as String? ?? '',
      LUBy: json['LUBy'] as String? ?? '',
      UpdDTimeUTC: json['UpdDTimeUTC'] as String? ?? '',
      UpdBy: json['UpdBy'] as String? ?? '',
      DeleteDTimeUTC: json['DeleteDTimeUTC'] as String? ?? '',
      DeleteBy: json['DeleteBy'] as String? ?? '',
      FlagIsDeleted: json['FlagIsDeleted'] as String? ?? '',
      FlagIsRecycle: json['FlagIsRecycle'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FileId': FileId,
      'NodeID': NodeID,
      'NetworkID': NetworkID,
      'SolutionCode': SolutionCode,
      'FileUrlLocal': FileUrlLocal,
      'FileUrlFS': FileUrlFS,
      'FileFullName': FileFullName,
      'FileType': FileType,
      'FileSize': FileSize,
      'FileContent': FileContent,
      'RefNo': RefNo,
      'RefType': RefType,
      'FileIdDelete': FileIdDelete,
      'CreateDTimeUTC': CreateDTimeUTC,
      'CreateBy': CreateBy,
      'LUDTimeUTC': LUDTimeUTC,
      'LUBy': LUBy,
      'UpdDTimeUTC': UpdDTimeUTC,
      'UpdBy': UpdBy,
      'DeleteDTimeUTC': DeleteDTimeUTC,
      'DeleteBy': DeleteBy,
      'FlagIsDeleted': FlagIsDeleted,
      'FlagIsRecycle': FlagIsRecycle,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}