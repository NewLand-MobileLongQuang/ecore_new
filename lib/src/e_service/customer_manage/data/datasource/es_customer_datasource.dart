
import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/es_customer_model.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rt_es_customer_detail_model.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_customer_detail.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/create_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_by_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/search_customer.dart';

import '../../../common/datasource/e_service_datasource.dart';

class ES_CustomerDataSource extends EServiceSvDataSource {
  ES_CustomerDataSource(super.client);

  Future<List<ES_CustomerModel>> search({required SearchCustomerParams params}) async {
    final paramsInit = {
      'KeyWord': params.KeyWord,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postSearchCustomer(
        path: 'MstCustomer/SearchForMobile',
        params: paramsInit,
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

  Future<ES_CustomerModel> create({required CreateCustomerParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postCreateCustomer(
        path: 'MstCustomer/CreateForMobile',
        params: paramsInit,
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

  Future<String> getCustomerCodeSys({required GetCustomerCodeSysParams params}) async {
    try {
      final response = await postGetCustomerCodeSys(
        path: 'Seq/GetCustomerCodeSys',
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

  Future<RT_ESCustomerDetailModel> getByCustomerCodeSys({required GetByCustomerCodeSysParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'CustomerCodeSys': params.CustomerCodeSys,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postGetByCustomerCodeSys(
        path: 'MstCustomer/GetByCustomerCodeSys',
        params: paramsInit,
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