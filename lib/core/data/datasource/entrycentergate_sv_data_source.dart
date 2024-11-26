
import '../../configs/app_config.dart';
import '../../errors/exceptions.dart';
import '../../modules/auth/data/models/data_user_model.dart';
import '../../modules/auth/data/models/object_result_model.dart';
import '../../modules/auth/domain/entities/session_info.dart';
import '../../utils/string_generate.dart';
import '../../utils/typedef.dart';
import '../models/clientgate_model.dart';
import 'base_remote_data_source.dart';

class EntryCenterGateSvDataSource extends BaseRemoteDataSrc {
  EntryCenterGateSvDataSource(super.client);

  @override
  String get baseUrl => AppConfig.current().entryCenterGateBaseUrl;

  @override
  Map<String, String>? getHeaders() {
    return {'accessToken': SessionInfo.current().auth.AccessToken};
  }

  Future<ClientgateModel<List<ObjectResultModel>>> post({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final networkId = ss.org?.ParentId == 0 ? ss.org?.Id : ss.org?.ParentId;
    final response = await doPostWithHeaders(
        path: path,
        headers: {
          'NetworkId': networkId.toString(),
          'GwUserCode': AppConfig.current().entryCenterGateGwUserCode,
          'GwPassword': AppConfig.current().entryCenterGateGwPassword,
        },
        params: params);
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJson(
        response['Data'] as DataMap,
        (data) => (data as List).map((e) => ObjectResultModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }
}