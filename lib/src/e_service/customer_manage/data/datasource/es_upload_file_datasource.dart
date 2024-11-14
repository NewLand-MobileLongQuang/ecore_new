
import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rt_es_file_upload_model.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/upload_file.dart';

import '../../../common/datasource/e_service_datasource.dart';

abstract class ES_UploadFileDataSource {
  Future<RT_ES_FileUploadModel> uploadFile({required UploadFileParams params});
}

class ES_UploadFileRemoteDataSource extends EServiceSvDataSource implements ES_UploadFileDataSource {
  ES_UploadFileRemoteDataSource(super.client);

  @override
  Future<RT_ES_FileUploadModel> uploadFile({required UploadFileParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await postUpload(
          path: 'File/UploadFile',
          params: paramsInit,
          filePath: params.file.path
      );
      final data = response['Data'] as dynamic;

      RT_ES_FileUploadModel res = RT_ES_FileUploadModel.fromMap(data);

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }
}