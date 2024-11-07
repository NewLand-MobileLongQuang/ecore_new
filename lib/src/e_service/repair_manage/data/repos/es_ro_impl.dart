import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/typedef.dart';
import '../../domain/entities/es_ro_detail.dart';
import '../../domain/entities/es_ro_error_type.dart';
import '../../domain/entities/es_ro_product.dart';
import '../../domain/entities/rt_es_ro_detail.dart';
import '../../domain/entities/rt_es_ro_error_component.dart';
import '../../domain/repos/es_ro_repo.dart';
import '../../domain/usecases/delete.dart';
import '../../domain/usecases/finish.dart';
import '../../domain/usecases/get_by_ro_no.dart';
import '../../domain/usecases/search.dart';
import '../../domain/usecases/search_error_component.dart';
import '../../domain/usecases/search_error_type.dart';
import '../../domain/usecases/search_product.dart';
import '../../domain/usecases/update.dart';
import '../datasource/es_ro_datasource.dart';


class ES_RORepositoryImpl implements ES_RORepository {

  ES_RORepositoryImpl(this._dataSource);
  final ES_RODataSource _dataSource;

  @override
  ResultFuture<List<ES_RODetail>> search({required SearchROParams params}) async {
    try {
      final result = await _dataSource.search(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_ES_RODetail> getByRONo({required GetByRONoParams params}) async {
    try {
      final result = await _dataSource.getByRONo(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid update({required UpdateROParams params}) async {
    try {
      final result = await _dataSource.update(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid delete({required DeleteROParams params}) async {
    try {
      final result = await _dataSource.delete(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ES_ROErrorType>> searchErrorType({required SearchErrorTypeParams params}) async {
    try {
      final result = await _dataSource.searchErrorType(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ES_ROProduct>> searchProduct({required SearchProductParams params}) async {
    try {
      final result = await _dataSource.searchProduct(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_ES_ROErrorComponent> searchErrorComponent({required SearchErrorComponentParams params}) async {
    try {
      final result = await _dataSource.searchErrorComponent(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid finish({required FinishROParams params}) async {
    try {
      final result = await _dataSource.finish(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}