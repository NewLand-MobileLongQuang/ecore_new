

import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/src/sky_cs/common/datasource/sky_cs_datasource.dart';
import 'package:ecore/src/sky_cs/customer/data/models/rt_sky_customer_all_detail_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/rt_sky_customer_type_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_column_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_contact_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_detail_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_group_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_hist_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_info_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_partner_type_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_zalo_user_model.dart';
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

class SKY_CustomerDataSource extends SkyCsSvDataSource {
  SKY_CustomerDataSource(super.client);

  Future<List<SKY_CustomerGroupModel>> searchCustomerGroup({required SearchCustomerGroupParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'FlagActive': params.FlagActive,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await post(
        path: 'MDMetaColGroup/Search',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;

      List<SKY_CustomerGroupModel> res =
      dataList.map<SKY_CustomerGroupModel>((i) => SKY_CustomerGroupModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<SKY_CustomerColumnModel>> searchCustomerColumn({required SearchCustomerColumnParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'FlagActive': params.FlagActive,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
      'OrderByClause': params.OrderByClause,
    };
    try {
      final response = await post(
        path: 'MDMetaColGroupSpec/Search',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;

      List<SKY_CustomerColumnModel> res =
      dataList.map<SKY_CustomerColumnModel>((i) => SKY_CustomerColumnModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<SKY_CustomerColumnModel>> getListOption({required GetListOptionParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'ColCodeSys': params.ColCodeSys,
      'FlagActive': params.FlagActive,
    };
    try {
      final response = await post(
        path: 'MDMetaColGroupSpec/GetListOption',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;

      List<SKY_CustomerColumnModel> res =
      dataList.map<SKY_CustomerColumnModel>((i) => SKY_CustomerColumnModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<String> createCustomerSkyCS({required CreateCustomerSkyCSParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
      'strJsonZaloUserFollower': params.strJsonZaloUserFollower,
      'strJsonEmail': params.strJsonEmail,
      'strJsonPhone': params.strJsonPhone,
      'strJsonCtmGroup': params.strJsonCtmGroup,
      'strJsonCtmPartnerType': params.strJsonCtmPartnerType,
      'strJsonUserManager': params.strJsonUserManager,
      'strJsonGovID': params.strJsonGovID,
      'ScrTplCodeSys': params.ScrTplCodeSys,
    };
    try {
      final response = await post(
        path: 'MstCustomer/Create',
        params: paramsInit,
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

  Future<RT_SKY_CustomerTypeModel> getAllCustomerType({required GetAllCustomerTypeParams params}) async {
    try {
      final response = await post(
        path: 'MstCustomerType/GetAllCustomerType',
      );
      final data = response['Data'] as dynamic;

      RT_SKY_CustomerTypeModel res = RT_SKY_CustomerTypeModel.fromMap(data);

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<SKY_CustomerPartnerTypeModel>> getAllCustomerPartnerType({required GetAllCustomerPartnerTypeParams params}) async {
    try {
      final response = await post(
        path: 'MstPartnerType/GetAllActive',
      );
      final dataList = response['DataList'] as List;

      List<SKY_CustomerPartnerTypeModel> res =
      dataList.map<SKY_CustomerPartnerTypeModel>((i) => SKY_CustomerPartnerTypeModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<SKY_CustomerZaloUserModel>> searchZaloUser({required SearchZaloUserParams params}) async {
    final paramsInit = {
      'ZaloUserName': params.ZaloUserName,
    };
    try {
      final response = await post(
        path: 'Zalo/SearchZaloUser',
        params: paramsInit,
      );
      final dataList = response['Data'] as List;

      List<SKY_CustomerZaloUserModel> res =
      dataList.map<SKY_CustomerZaloUserModel>((i) => SKY_CustomerZaloUserModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  // manage + detail

  Future<List<SKY_CustomerInfoModel>> searchCustomer({required SearchCustomerSkyCSParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'KeyWord': params.KeyWord,
      'FlagActive': params.FlagActive,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await post(
        path: 'MstCustomer/Search',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;
      List<SKY_CustomerInfoModel> res =
      dataList.map<SKY_CustomerInfoModel>((i) => SKY_CustomerInfoModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_CustomerDetailModel> getByCustomerCodeSys({required GetByCustomerCodeSysParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'CustomerCodeSys': params.CustomerCodeSys,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await post(
        path: 'MstCustomer/GetByCustomerCodeSys',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;

      SKY_CustomerDetailModel res = SKY_CustomerDetailModel.fromMap(data);

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<SKY_CustomerHistModel>> searchCustomerHist({required SearchCustomerHistParams params}) async {
    final paramsInit = {
      'CustomerCodeSys': params.CustomerCodeSys,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await post(
        path: 'MstCustomerHist/Search',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;

      List<SKY_CustomerHistModel> res =
      dataList.map<SKY_CustomerHistModel>((i) => SKY_CustomerHistModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<SKY_CustomerContactModel>> searchCustomerContact({required SearchCustomerContactParams params}) async {
    final paramsInit = {
      'CustomerCodeSys': params.CustomerCodeSys,
      'FlagActive': params.FlagActive,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
      'OrderByClause': params.OrderByClause,
    };
    try {
      final response = await post(
        path: 'MstCustomerContact/Search',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;

      List<SKY_CustomerContactModel> res =
      dataList.map<SKY_CustomerContactModel>((i) => SKY_CustomerContactModel.fromMap(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<RT_SKY_CustomerAllDetailModel> getAllByCustomerCodeSys({required GetAllByCustomerCodeSysParams params}) async {
    final paramsInit = {
      'CustomerCodeSys': params.CustomerCodeSys,
    };
    try {
      final response = await post(
        path: 'MstCustomer/GetAllByCustomerCodeSys',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;

      RT_SKY_CustomerAllDetailModel res = RT_SKY_CustomerAllDetailModel.fromMap(data);

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<String> deleteCustomerSkyCS({required DeleteCustomerParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await post(
        path: 'MstCustomer/Delete',
        params: paramsInit,
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
}