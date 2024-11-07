import '../../configs/app_config.dart';
import '../../errors/exceptions.dart';
import '../../modules/auth/domain/entities/session_info.dart';
import '../../utils/typedef.dart';
import '../models/mobilesv_model.dart';
import 'base_remote_data_source.dart';


class MobileSvDataSrc extends BaseRemoteDataSrc {
  const MobileSvDataSrc(super._client);

  @override
  String get baseUrl => AppConfig.current().mobileServiceBaseUrl;

  @override
  Map<String, String>? getHeaders() {
    final ss = SessionInfo.current();
    return {'accessToken': ss.isAuthenticated() ? ss.auth.AccessToken : ''};
  }

  Future<dynamic> post({required String path, DataMap? params}) async {


    final response = await doPost(
        path: path,
        params: params);

    final res = MobileSvDataModel.fromMap(response as DataMap);

    if (res.Success) {
      return res.DataMapData!;
    } else {
      throw ApiException(
          Message: res.ErrorMessage,
          Code: res.ErrorCode,
          Detail: res.ErrorDetail);
    }
  }
}
