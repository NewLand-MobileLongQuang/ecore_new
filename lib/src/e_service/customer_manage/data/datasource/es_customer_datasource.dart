
import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/es_customer_model.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rt_es_customer_detail_model.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_customer_detail.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/create_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_by_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/search_customer.dart';

import '../../../common/datasource/e_service_datasource.dart';

abstract class ES_CustomerDataSource {
  Future<List<ES_CustomerModel>> search({required SearchCustomerParams params});
  Future<ES_CustomerModel> create({required CreateCustomerParams params});
  Future<String> getCustomerCodeSys({required GetCustomerCodeSysParams params});
  Future<RT_ESCustomerDetailModel> getByCustomerCodeSys({required GetByCustomerCodeSysParams params});
}

class ES_CustomerRemoteDataSource extends EServiceSvDataSource implements ES_CustomerDataSource {
  ES_CustomerRemoteDataSource(super.client);

  @override
  Future<List<ES_CustomerModel>> search({required SearchCustomerParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
        path: 'MstCustomer/SearchForMobile',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;

      List<ES_CustomerModel> res =
      dataList.map<ES_CustomerModel>((i) => ES_CustomerModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  @override
  Future<ES_CustomerModel> create({required CreateCustomerParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
        path: 'MstCustomer/CreateForMobile',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;

      ES_CustomerModel res = ES_CustomerModel.fromMap(data);

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  @override
  Future<String> getCustomerCodeSys({required GetCustomerCodeSysParams params}) async {
    try {
      final response = await post(
        path: 'Seq/GetCustomerCodeSys',
      );
      final data = response['Data'] as dynamic;

      String res = data as String;

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  @override
  Future<RT_ESCustomerDetailModel> getByCustomerCodeSys({required GetByCustomerCodeSysParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
        path: 'MstCustomer/GetByCustomerCodeSys',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;

      RT_ESCustomerDetailModel res = RT_ESCustomerDetailModel.fromMap(data);

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }
}