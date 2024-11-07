import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_file_upload.dart';
import 'package:ecore/src/e_service/customer_manage/domain/repos/es_upload_file_repo.dart';

class UploadFileParams extends Equatable {
  const UploadFileParams({required this.file});
  final File file;

  @override
  List<Object?> get props => [file];
}

class UploadFileUseCase extends UsecaseWithParams<RT_ES_FileUpload, UploadFileParams> {
  UploadFileUseCase(this._repository);
  final ES_UploadFileRepository _repository;

  @override
  ResultFuture<RT_ES_FileUpload> call(UploadFileParams params) async {
    return await _repository.uploadFile(params: params);
  }
}