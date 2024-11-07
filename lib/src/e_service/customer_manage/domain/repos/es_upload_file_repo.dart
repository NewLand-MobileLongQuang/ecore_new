import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_file_upload.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/upload_file.dart';

abstract class ES_UploadFileRepository {
  ResultFuture<RT_ES_FileUpload> uploadFile({required UploadFileParams params});
}