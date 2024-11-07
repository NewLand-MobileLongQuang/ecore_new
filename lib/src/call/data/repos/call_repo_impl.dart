import 'package:dartz/dartz.dart';
import 'package:ecore/src/call/domain/entities/agent.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/call_log.dart';
import '../../domain/entities/calling_info.dart';
import '../../domain/repos/call_repo.dart';

import '../datasource/call_data_source.dart';

class CallRepoImpl implements CallRepo {
  const CallRepoImpl(this._datasource);

  final CallDataSrc _datasource;

  @override
  ResultFuture<CallingInfo> getCallingInfo() async {
    try {
      final result = await _datasource.getCallingInfo();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }


  @override
  ResultFuture<List<CallLog>> getCallLog() async {
    try {
      final result = await _datasource.getCallLog();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Agent>> getAgentList() async {
    try {
      final result = await _datasource.getAgentList();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<CallLog> redirect(String target) async {
    try {
      final result = await _datasource.redirect(target);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}

  

