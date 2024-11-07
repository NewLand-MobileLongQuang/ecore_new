import 'package:equatable/equatable.dart';

class ES_WarrantyAttachFile extends Equatable {
  ES_WarrantyAttachFile({
    required this.Idx,
    required this.FileName,
    required this.FilePath,
    required this.FileType,
    required this.FileSize,
  });

  int Idx;
  final String FileName;
  final String FilePath;
  final String FileType;
  final String FileSize;
  @override
  List<Object?> get props => [Idx, FileName, FilePath, FileType, FileSize];
}