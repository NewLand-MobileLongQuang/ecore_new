import 'package:dartz/dartz.dart';

import '../../../../errors/exceptions.dart';
import '../../../../errors/failure.dart';
import '../../../../utils/typedef.dart';
import '../../domain/entities/object_result.dart';
import '../../domain/entities/sys_user.dart';
import '../../domain/repos/entry_center_gate_repo.dart';
import '../datasource/entry_center_gate_data_source.dart';

class EntryCenterGateRepoImpl implements EntryCenterGateRepo {

  EntryCenterGateRepoImpl(this._dataSource);
  final EntryCenterGateRemoteDataSource _dataSource;

  @override
  ResultFuture<List<ObjectResult>> getByNetworks({required String solutionCode, required String networkId}) async {
    try {
      final result = await _dataSource.getByNetworks(solutionCode: solutionCode, networkId: networkId);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<DataUser> getForCurrentUser() async {
    try {
      final result = await _dataSource.getForCurrentUser();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}