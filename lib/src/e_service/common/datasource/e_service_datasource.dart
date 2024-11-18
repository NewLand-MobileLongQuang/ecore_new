import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/common/utils.dart';

import '../../../../core/data/datasource/base_remote_data_source.dart';
import '../../../../core/data/models/clientgate_model.dart';
import '../../../../core/modules/auth/domain/entities/session_info.dart';

class EServiceSvDataSource extends BaseRemoteDataSrc {
  EServiceSvDataSource(super.client);

  @override
  Map<String, String>? getHeaders() {
    final ss = SessionInfo.current();

    var solutionInfo= EServiceUtils.getSolution();
    return {
      'Authorization': 'Bearer ${ss.auth.AccessToken}',
      'NetworkId': ss.org?.Id.toString() ?? '',
      'OrgId': ss.org?.Id.toString() ?? '',
      'GwUserCode': solutionInfo.gwUserCode,
      'GwPassword': solutionInfo.gwPassword,
      'UtcOffset': ss.user.TimeZone.toString(),
      'AppAgent': solutionInfo.appAgent,
      'AppLanguageCode': ss.user.Language ?? 'vi',
      'AppVerCode': solutionInfo.appVerCode,
      'Tid': StringGenerate.getCurrentTime(),
      'AppTId': StringGenerate.getCurrentTime(),
    };
  }

  @override
  String get baseUrl {
    final ss = SessionInfo.current();
    var url = ss.getCache(EServiceUtils.getApiUrlKey());
    if(url!=null && url.isNotEmpty ) {
      return url;
    } else {
      throw const ApiException(Message: 'No Api Url');
    }
  }

  Future<dynamic> post({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();

    final response = await doPost(
        path: path,
        params: params,
        );
    final res = ClientGateModel.fromMap(response['Data'] as DataMap);
    if(res.strErrCode!="0") {
      throw ApiException(Code: res.strErrCode, Message: 'Error ${res.strErrCode}');
    }
    return res.objResult;
  }

  Future<dynamic> postUpload({required String path, DataMap? params, required String filePath}) async {
    final ss = SessionInfo.current();

    final response = await doPostWithHeadersAndFile(
        path: path,
        params: params,
        filePath: filePath,
    );
    final res = ClientGateModel.fromMap(response['Data'] as DataMap);
    if(res.strErrCode!="0")
    {
      throw ApiException(Code: res.strErrCode, Message: 'Error ${res.strErrCode}');
    }
    return res.objResult;
  }
}
