import 'package:dartz/dartz.dart';

import '../../../../errors/exceptions.dart';
import '../../../../errors/failure.dart';
import '../../../../utils/typedef.dart';
import '../../domain/entities/session_info.dart';
import '../../domain/repos/local_session_repo.dart';
import '../datasource/session_info_local_data_src.dart';

class LocalSessionRepoImpl implements LocalSessionRepo {
  const LocalSessionRepoImpl(this._localDataSource);

  final SessionInfoLocalDataSrc _localDataSource;

  @override
  ResultSync<SessionInfo?> loadSessionInfo() {
    try {
      final result = _localDataSource.loadSessionInfo();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }

  @override
  ResultVoid saveSessionInfo({required SessionInfo? info}) async {
    try {
      await _localDataSource.saveSessionInfo(info);
      SessionInfo.reset();
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }
}
