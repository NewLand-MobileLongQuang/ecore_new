import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/core/errors/failure.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/datasource/es_warranty_datasource.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rt_es_warranty_activate_by_qr_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rt_es_warranty_detail_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/create.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/delete.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_by_warranty_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_input_by_serial_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/search.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/update.dart';

class ES_WarrantyRepositoryImpl implements ES_WarrantyRepository {

  ES_WarrantyRepositoryImpl(this._dataSource);
  final ES_WarrantyDataSource _dataSource;

  @override
  ResultFuture<List<ES_WarrantyDetail>> search({required SearchWarrantyParams params}) async {
    try {
      final result = await _dataSource.search(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_ES_WarrantyDetailModel> getByWarrantyNo({required GetByWarrantyNoParams params}) async {
    try {
      final result = await _dataSource.getByWarrantyNo(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid update({required UpdateWarrantyParams params}) async {
    try {
      await _dataSource.update(params: params);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid delete({required DeleteWarrantyParams params}) async {
    try {
      await _dataSource.delete(params: params);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<RT_ES_WarrrantyActivateByQRModel>> getInputBySerialNo({required GetInputBySerialNoParams params}) async {
    try {
      final result = await _dataSource.getInputBySerialNo(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_ES_WarrantyDetailModel> create({required CreateWarrantyParams params}) async {
    try {
      final result = await _dataSource.create(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}