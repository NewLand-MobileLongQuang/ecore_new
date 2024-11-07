
import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rt_es_file_upload_model.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/upload_file.dart';

import '../../../common/datasource/e_service_datasource.dart';

class ES_UploadFileDataSource extends EServiceSvDataSource {
  ES_UploadFileDataSource(super.client);

  Future<RT_ES_FileUploadModel> uploadFile({required UploadFileParams params}) async {
    final paramsInit = {
      'file': params.file,
    };
    try {
      final response = await postUploadFile(
          path: 'File/UploadFile',
          params: paramsInit,
          filePath: params.file.path
      );
      return response.objResult!;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }
}