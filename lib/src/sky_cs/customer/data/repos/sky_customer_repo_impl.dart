import 'package:dartz/dartz.dart';
import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/core/errors/failure.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/data/datasource/sky_customer_datasource.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rt_sky_customer_all_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rt_sky_customer_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_contact.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_group.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_hist.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_info.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_partner_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_zalo_user.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/create_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/delete_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_by_customer_code_sys.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_customer_partner_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_customer_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_by_customer_code_sys.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_list_option.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_contact.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_group.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_hist.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_zalo_user.dart';

class SKY_CustomerRepositoryImpl implements SKY_CustomerRepository {
  SKY_CustomerRepositoryImpl(this._dataSource);
  final SKY_CustomerDataSource _dataSource;

  @override
  ResultFuture<List<SKY_CustomerGroup>> searchCustomerGroup({required SearchCustomerGroupParams params}) async {
    try {
      final result = await _dataSource.searchCustomerGroup(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_CustomerColumn>> searchCustomerColumn({required SearchCustomerColumnParams params}) async {
    try {
      final result = await _dataSource.searchCustomerColumn(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_CustomerColumn>> getListOption({required GetListOptionParams params}) async {
    try {
      final result = await _dataSource.getListOption(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<String> createCustomerSkyCS({required CreateCustomerSkyCSParams params}) async {
    try {
      final result = await _dataSource.createCustomerSkyCS(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_SKY_CustomerType> getAllCustomerType({required GetAllCustomerTypeParams params}) async {
    try {
      final result = await _dataSource.getAllCustomerType(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_CustomerPartnerType>> getAllCustomerPartnerType({required GetAllCustomerPartnerTypeParams params}) async {
    try {
      final result = await _dataSource.getAllCustomerPartnerType(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_CustomerZaloUser>> searchZaloUser({required SearchZaloUserParams params}) async {
    try {
      final result = await _dataSource.searchZaloUser(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_CustomerInfo>> searchCustomer({required SearchCustomerSkyCSParams params}) async {
    try {
      final result = await _dataSource.searchCustomer(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SKY_CustomerDetail> getByCustomerCodeSys({required GetByCustomerCodeSysParams params}) async {
    try {
      final result = await _dataSource.getByCustomerCodeSys(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_CustomerHist>> searchCustomerHist({required SearchCustomerHistParams params}) async {
    try {
      final result = await _dataSource.searchCustomerHist(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_CustomerContact>> searchCustomerContact({required SearchCustomerContactParams params}) async {
    try {
      final result = await _dataSource.searchCustomerContact(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_SKY_CustomerAllDetail> getAllByCustomerCodeSys({required GetAllByCustomerCodeSysParams params}) async {
    try {
      final result = await _dataSource.getAllByCustomerCodeSys(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<String> deleteCustomerSkyCS({required DeleteCustomerParams params}) async {
    try {
      final result = await _dataSource.deleteCustomerSkyCS(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
