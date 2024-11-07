
import '../../../../configs/app_config.dart';
import '../../../../data/datasource/entrycentergate_sv_data_source.dart';
import '../../../../errors/exceptions.dart';
import '../../domain/entities/object_result.dart';
import '../../domain/entities/sys_user.dart';

abstract class EntryCenterGateDataSource {
  Future<List<ObjectResult>> getByNetworks({required String solutionCode, required String networkId});
  Future<DataUser> getForCurrentUser();
}

class EntryCenterGateRemoteDataSource extends EntryCenterGateSvDataSource implements EntryCenterGateDataSource{
  EntryCenterGateRemoteDataSource(super.client);

  @override
  Future<List<ObjectResult>> getByNetworks({required String solutionCode, required String networkId}) async {
    final params = {
      'SolutionCode': solutionCode,
      'NetworkIDSearch': networkId,
    };
    try {
      final response = await post(
          path: '/EntryCtMstNetwork/GetByNetwork',
          params: params,
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

  @override
  Future<DataUser> getForCurrentUser() async {
    try {
      final response = await postUser(
        path: '/api/GetForCurrentUser',
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