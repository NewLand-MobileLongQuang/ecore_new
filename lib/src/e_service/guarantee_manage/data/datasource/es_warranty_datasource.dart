
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

abstract class ES_WarrantyDataSource {
  Future<List<ES_WarrantyDetailModel>> search({required SearchWarrantyParams params});
  Future<RT_ES_WarrantyDetailModel> getByWarrantyNo({required GetByWarrantyNoParams params});
  Future<void> update({required UpdateWarrantyParams params});
  Future<void> delete({required DeleteWarrantyParams params});
  Future<List<RT_ES_WarrrantyActivateByQRModel>> getInputBySerialNo({required GetInputBySerialNoParams params});
  Future<RT_ES_WarrantyDetailModel> create({required CreateWarrantyParams params});
}

class ES_WarrantyRemoteDataSource extends EServiceSvDataSource implements ES_WarrantyDataSource {
  ES_WarrantyRemoteDataSource(super.client);

  @override
  Future<List<ES_WarrantyDetailModel>> search({required SearchWarrantyParams params}) async {
    final paramsInit = params.toMap();

    try {
      final response = await post(
        path: 'ESWarranty/Search',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;

      List<ES_WarrantyDetailModel> res =
      dataList.map<ES_WarrantyDetailModel>((i) => ES_WarrantyDetailModel.fromMap(i)).toList();

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
  Future<RT_ES_WarrantyDetailModel> getByWarrantyNo({required GetByWarrantyNoParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
        path: 'ESWarranty/GetByWarrantyNo',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;

      RT_ES_WarrantyDetailModel res = RT_ES_WarrantyDetailModel.fromMap(data);

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
  Future<void> update({required UpdateWarrantyParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
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

  @override
  Future<void> delete({required DeleteWarrantyParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
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

  @override
  Future<List<RT_ES_WarrrantyActivateByQRModel>> getInputBySerialNo({required GetInputBySerialNoParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
        path: 'ESWarranty/GetInputBySerialNo',
        params: paramsInit,
      );
      final dataList = response['DataList'] as List;

      List<RT_ES_WarrrantyActivateByQRModel> res =
      dataList.map<RT_ES_WarrrantyActivateByQRModel>((i) => RT_ES_WarrrantyActivateByQRModel.fromMap(i)).toList();

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
  Future<RT_ES_WarrantyDetailModel> create({required CreateWarrantyParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
        path: 'ESWarranty/Create',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;

      RT_ES_WarrantyDetailModel res = RT_ES_WarrantyDetailModel.fromMap(data);

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