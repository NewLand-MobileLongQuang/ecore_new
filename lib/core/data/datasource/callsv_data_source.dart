import 'package:path/path.dart';

import '../../configs/app_config.dart';
import '../../errors/exceptions.dart';
import '../../modules/auth/domain/entities/session_info.dart';
import '../../utils/typedef.dart';

import '../models/callsv_model.dart';
import 'base_remote_data_source.dart';


class CallSvDataSrc extends BaseRemoteDataSrc {
  const CallSvDataSrc(super._client);

  @override
  String get baseUrl => AppConfig.current().callServiceBaseUrl;

  @override
  Map<String, String>? getHeaders() {
    final ss = SessionInfo.current();

    return {'accessToken': SessionInfo.current().auth.AccessToken,
      'networkId': ss.org!=null?ss.org!.getNetworkId().toString(): '0',
    };
  }

  Future<dynamic> post({required String path, DataMap? params}) async {


    final response = await doPost(
        path: path,
        params: params);

    final res = CallSvDataModel.fromMap(response as DataMap);

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
