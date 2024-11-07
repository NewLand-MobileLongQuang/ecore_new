
import 'dart:convert';

import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_detail_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rt_es_warranty_detail_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/create.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/delete.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_by_warranty_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_input_by_serial_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/search.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/update.dart';

import '../../../../../core/utils/typedef.dart';
import '../../../common/datasource/e_service_datasource.dart';
import '../models/rt_es_warranty_activate_by_qr_model.dart';

class ES_WarrantyDataSource extends EServiceSvDataSource {
  ES_WarrantyDataSource(super.client);

  Future<List<ES_WarrantyDetailModel>> search({required SearchWarrantyParams params}) async {
    final paramsInit = {
      'SerialNo': params.SerialNo,
      'ProductCode': params.ProductCode,
      'CustomerPhoneNo': params.CustomerPhoneNo,
      'CustomerAddress': params.CustomerAddress,
      'AgentCode': params.AgentCode,
      'InstallationDTimeUTCFrom': params.InstallationDTimeUTCFrom,
      'InstallationDTimeUTCTo': params.InstallationDTimeUTCTo,
      'WarrantyDTimeUTCFrom': params.WarrantyDTimeUTCFrom,
      'WarrantyDTimeUTCTo': params.WarrantyDTimeUTCTo,
      'WarrantyExpDTimeUTCFrom': params.WarrantyExpDTimeUTCFrom,
      'WarrantyExpDTimeUTCTo': params.WarrantyExpDTimeUTCTo,
      'Remark': params.Remark,
      'OrgID': params.OrgID,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };


    try {
      final response = await post(
        path: 'ESWarranty/Search',
        params: paramsInit,
      );
      //return response.objResult!;



      final list = response['DataList'] as List;
      // .map((i) => AgentModel.fromMap(i)).toList();

      List<ES_WarrantyDetailModel> ret =
      list.map<ES_WarrantyDetailModel>((i) => ES_WarrantyDetailModel.fromJson(i)).toList();

      return ret;

    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<ES_WarrantyDetailModel>> search_old({required SearchWarrantyParams params}) async {
    final paramsInit = {
      'SerialNo': params.SerialNo,
      'ProductCode': params.ProductCode,
      'CustomerPhoneNo': params.CustomerPhoneNo,
      'CustomerAddress': params.CustomerAddress,
      'AgentCode': params.AgentCode,
      'InstallationDTimeUTCFrom': params.InstallationDTimeUTCFrom,
      'InstallationDTimeUTCTo': params.InstallationDTimeUTCTo,
      'WarrantyDTimeUTCFrom': params.WarrantyDTimeUTCFrom,
      'WarrantyDTimeUTCTo': params.WarrantyDTimeUTCTo,
      'WarrantyExpDTimeUTCFrom': params.WarrantyExpDTimeUTCFrom,
      'WarrantyExpDTimeUTCTo': params.WarrantyExpDTimeUTCTo,
      'Remark': params.Remark,
      'OrgID': params.OrgID,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postSearchWarranty(
        path: 'ESWarranty/Search',
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


  Future<RT_ES_WarrantyDetailModel> getByWarrantyNo({required GetByWarrantyNoParams params}) async {
    final paramsInit = {
      'WarrantyNo': params.WarrantyNo,
    };
    try {
      final response = await postGetByWarrantyNo(
        path: 'ESWarranty/GetByWarrantyNo',
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

  Future<void> update({required UpdateWarrantyParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postChange(
        path: 'ESWarranty/Update',
        params: paramsInit,
      );
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<void> delete({required DeleteWarrantyParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postChange(
        path: 'ESWarranty/Delete',
        params: paramsInit,
      );
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<RT_ES_WarrrantyActivateByQRModel>> getInputBySerialNo({required GetInputBySerialNoParams params}) async {
    final paramsInit = {
      'SerialNo': params.SerialNo,
    };
    try {
      final response = await postGetInputBySerialNo(
        path: 'ESWarranty/GetInputBySerialNo',
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

  Future<RT_ES_WarrantyDetailModel> create({required CreateWarrantyParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postCreate(
        path: 'ESWarranty/Create',
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