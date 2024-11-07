import 'package:equatable/equatable.dart';

class ES_ROAttachFile extends Equatable {
  ES_ROAttachFile({
    required this.Idx,
    required this.FileName,
    required this.FilePath,
    required this.FileType,
    required this.FileSize,
    required this.ROAttachFileType,
  });

  int Idx;
  final String FileName;
  final String FilePath;
  final String FileType;
  final String FileSize;
  final String ROAttachFileType;

  @override
  List<Object?> get props => [Idx, FileName, FilePath, FileType, FileSize, ROAttachFileType];
}