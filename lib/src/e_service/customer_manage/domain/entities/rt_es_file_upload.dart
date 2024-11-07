import 'package:equatable/equatable.dart';

class RT_ES_FileUpload extends Equatable {
  RT_ES_FileUpload({required this.FileId, required this.NodeID, required this.NetworkID, required this.SolutionCode, required this.FileUrlLocal, required this.FileUrlFS, required this.FileFullName, required this.FileType, required this.FileSize, required this.FileContent, required this.RefNo, required this.RefType, required this.FileIdDelete, required this.CreateDTimeUTC, required this.CreateBy, required this.LUDTimeUTC, required this.LUBy, required this.UpdDTimeUTC, required this.UpdBy, required this.DeleteDTimeUTC, required this.DeleteBy, required this.FlagIsDeleted, required this.FlagIsRecycle, required this.LogLUDTimeUTC, required this.LogLUBy});

  final String FileId;
  final String NodeID;
  final String NetworkID;
  final String SolutionCode;
  final String FileUrlLocal;
  final String FileUrlFS;
  final String FileFullName;
  final String FileType;
  final double FileSize;
  final String FileContent;
  final String RefNo;
  final String RefType;
  final String FileIdDelete;
  final String CreateDTimeUTC;
  final String CreateBy;
  final String LUDTimeUTC;
  final String LUBy;
  final String UpdDTimeUTC;
  final String UpdBy;
  final String DeleteDTimeUTC;
  final String DeleteBy;
  final String FlagIsDeleted;
  final String FlagIsRecycle;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [FileId, NodeID, NetworkID, SolutionCode, FileUrlLocal, FileUrlFS, FileFullName, FileType, FileSize, FileContent, RefNo, RefType, FileIdDelete, CreateDTimeUTC, CreateBy, LUDTimeUTC, LUBy, UpdDTimeUTC, UpdBy, DeleteDTimeUTC, DeleteBy, FlagIsDeleted, FlagIsRecycle, LogLUDTimeUTC, LogLUBy];
}