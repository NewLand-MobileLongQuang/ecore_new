import 'package:dartz/dartz.dart';
import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/core/errors/failure.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/customer_manage/data/datasource/es_upload_file_datasource.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rt_es_file_upload_model.dart';
import 'package:ecore/src/e_service/customer_manage/domain/repos/es_upload_file_repo.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/upload_file.dart';

class ES_UploadFileRepositoryImpl implements ES_UploadFileRepository {
  ES_UploadFileRepositoryImpl(this._dataSource);

  final ES_UploadFileDataSource _dataSource;

  @override
  ResultFuture<RT_ES_FileUploadModel> uploadFile({required UploadFileParams params}) async {
    try {
      final result = await _dataSource.uploadFile(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}

