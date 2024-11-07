import 'package:dartz/dartz.dart';
import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/core/errors/failure.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/customer_manage/data/datasource/es_customer_datasource.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_customer_detail.dart';
import 'package:ecore/src/e_service/customer_manage/domain/repos/es_customer_repo.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/create_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_by_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/search_customer.dart';

class ES_CustomerRepositoryImpl implements ES_CustomerRepository {
  ES_CustomerRepositoryImpl(this._dataSource);
  final ES_CustomerDataSource _dataSource;

  @override
  ResultFuture<List<ES_Customer>> search({required SearchCustomerParams params}) async {
    try {
      final result = await _dataSource.search(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<ES_Customer> create({required CreateCustomerParams params}) async {
    try {
      final result = await _dataSource.create(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<String> getCustomerCodeSys({required GetCustomerCodeSysParams params}) async {
    try {
      final result = await _dataSource.getCustomerCodeSys(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_ESCustomerDetail> getByCustomerCodeSys({required GetByCustomerCodeSysParams params}) async {
    try {
      final result = await _dataSource.getByCustomerCodeSys(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}