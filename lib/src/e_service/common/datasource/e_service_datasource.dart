import 'package:ecore/core/errors/exceptions.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/es_customer_model.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rt_es_customer_detail_model.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rt_es_file_upload_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_detail_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rt_es_warranty_activate_by_qr_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rt_es_warranty_detail_model.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_detail_model.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_error_type_model.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_product_model.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/rt_es_ro_detail_model.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/rt_es_ro_error_component_model.dart';

import '../../../../core/data/datasource/base_remote_data_source.dart';
import '../../../../core/data/models/clientgate_model.dart';
import '../../../../core/modules/auth/data/models/data_user_model.dart';
import '../../../../core/modules/auth/domain/entities/session_info.dart';

class EServiceSvDataSource extends BaseRemoteDataSrc {
  EServiceSvDataSource(super.client);

  @override
  Map<String, String>? getHeaders() {
    final ss = SessionInfo.current();

    var solutionInfo= EServiceUtils.getSolution();
    return {
      'Authorization': 'Bearer ${ss.auth.AccessToken}',
      'NetworkId': ss.org?.Id.toString() ?? '',
      'OrgId': ss.org?.Id.toString() ?? '',
      'GwUserCode': solutionInfo.gwUserCode,
      'GwPassword': solutionInfo.gwPassword,
      'UtcOffset': ss.user.TimeZone.toString(),
      'AppAgent': solutionInfo.appAgent,
      'AppLanguageCode': ss.user.Language ?? 'vi',
      'AppVerCode': solutionInfo.appVerCode,
      'Tid': StringGenerate.getCurrentTime(),
      'AppTId': StringGenerate.getCurrentTime(),
    };
  }

  @override
  String get baseUrl {
    final ss = SessionInfo.current();
    var url = ss.getCache(EServiceUtils.getApiUrlKey());
    if(url!=null && url.isNotEmpty ) {
      return url;
    } else {
      throw const ApiException(Message: 'No Api Url');
    }
  }


  Future<dynamic> post({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();

    final response = await doPost(
        path: path,
        params: params,
        );

    final res = ClientGateModel.fromMap(response['Data'] as DataMap);

    if(res.strErrCode!="0")
      {
        throw ApiException(Code: res.strErrCode, Message: 'Error ${res.strErrCode}');
      }


    return res.objResult;
  }






  Future<dynamic> postUpload({required String path, DataMap? params, required String filePath}) async {
    final ss = SessionInfo.current();

    final response = await doPostWithHeadersAndFile(
        path: path,
        params: params, headers: getHeaders()!, filePath: filePath);

    final res = ClientGateModel.fromMap(response['Data'] as DataMap);

    if(res.strErrCode!="0")
    {
      throw ApiException(Code: res.strErrCode, Message: 'Error ${res.strErrCode}');
    }


    return res.objResult;
  }



//////////////////////////////////////////

  Future<ClientgateModel<List<ES_WarrantyDetailModel>>> postSearchWarranty(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final header = getHeaders();
    final response = await doPostWithHeaders(
      path: path,
      headers: header!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjDataList(
        response['Data'] as DataMap,
            (data) => (data as List)
            .map((e) => ES_WarrantyDetailModel.fromJson(e as DataMap))
            .toList(),
      );
      return res;
    }
  }


  //Other


  Future<ClientgateModel<DataUserModel>> post1(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
        path: path, headers: getHeaders()!, params: params);
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonClient(
        response['Data'] as DataMap,
        (data) => DataUserModel.fromMap(data as DataMap),
      );
      return res;
    }
  }

  Future<ClientgateModel<RT_ES_FileUploadModel>> postUploadFile(
      {required String path, DataMap? params, required String filePath}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeadersAndFile(
        path: path,
        headers: getHeaders()!,
        params: params,
        filePath: filePath);
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => RT_ES_FileUploadModel.fromMap(data as DataMap),
      );
      return res;
    }
  }

  // Customer

  Future<ClientgateModel<List<ES_CustomerModel>>> postSearchCustomer(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjDataList(
        response['Data'] as DataMap,
        (data) => (data as List)
            .map((e) => ES_CustomerModel.fromMap(e as DataMap))
            .toList(),
      );
      return res;
    }
  }

  Future<ClientgateModel<ES_CustomerModel>> postCreateCustomer(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => ES_CustomerModel.fromMap(data as DataMap),
      );
      return res;
    }
  }

  Future<ClientgateModel<String>> postGetCustomerCodeSys(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => data as String,
      );
      return res;
    }
  }

  Future<ClientgateModel<RT_ESCustomerDetailModel>> postGetByCustomerCodeSys(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => RT_ESCustomerDetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  // Warranty

  Future<ClientgateModel<List<ES_WarrantyDetailModel>>> postSearchWarranty_old(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final header = getHeaders();
    final response = await doPostWithHeaders(
      path: path,
      headers: header!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjDataList(
        response['Data'] as DataMap,
        (data) => (data as List)
            .map((e) => ES_WarrantyDetailModel.fromJson(e as DataMap))
            .toList(),
    );
    return res;
  }
}

Future<ClientgateModel<RT_ES_WarrantyDetailModel>> postGetByWarrantyNo(
    {required String path, DataMap? params}) async {
  final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => RT_ES_WarrantyDetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  // Future<ClientgateModel<MDMetaColGroupSpecSearchModel>> postGetaAdvancedSearch(
  //     {required String path, DataMap? params}) async {
  //   final ss = SessionInfo.current();
  //   final response = {
  //     "Data": {
  //       "_strTId": "01760b76-7fab-43bf-b41c-849779d5e973",
  //       "_strAppTId": "39dcc024-048c-4022-8a20-3adfe94d1ddc",
  //       "_objTTime": "2024-06-26 16:35:36.970",
  //       "_strType": "MDMetaColGroupSpecSearch",
  //       "_strErrCode": "0",
  //       "_objResult": {
  //         "PageIndex": 0,
  //         "PageSize": 1000,
  //         "PageCount": 1,
  //         "ItemCount": 4,
  //         "DataList": [
  //           {
  //             "OrgID": "7206207001",
  //             "ColGrpCodeSys": "COLGRPCODESYS.2023.01",
  //             "ColCodeSys": "C003",
  //             "NetworkID": "7206207001",
  //             "ColOperatorType": "EQUAL",
  //             "OrderIdx": 14,
  //             "JsonRenderParams": null,
  //             "JsonListOption": null,
  //             "FlagIsNotNull": "0",
  //             "FlagIsCheckDuplicate": "0",
  //             "FlagIsQuery": "0",
  //             "FlagActive": "1",
  //             "LogLUDTimeUTC": "2024-06-03 03:51:40",
  //             "LogLUBy": "0317844394@INOS.VN",
  //             "ColCode": "C002",
  //             "ColCaption": "Quy mô nhân sự",
  //             "ColDataType": "SELECTONEDROPDOWN",
  //             "FlagIsColDynamic": "1",
  //             "SqlOperatorType": "=",
  //             "mdmc_JsonListOption":
  //                 "[{\"Value\":\"Dưới 10\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":0},{\"Value\":\"Từ 10 - 100 \",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":1},{\"Value\":\"Từ 100 - 200\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":2},{\"Value\":\"Từ 200 - 1000\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":3},{\"Value\":\"Trên 1000\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":4}]",
  //             "Lst_MD_OptionValue": null
  //           },
  //           {
  //             "OrgID": "7206207001",
  //             "ColGrpCodeSys": "COLGRPCODESYS.2023.01",
  //             "ColCodeSys": "C005",
  //             "NetworkID": "7206207001",
  //             "ColOperatorType": "LIKE",
  //             "OrderIdx": 21,
  //             "JsonRenderParams": null,
  //             "JsonListOption": null,
  //             "FlagIsNotNull": "0",
  //             "FlagIsCheckDuplicate": "0",
  //             "FlagIsQuery": "0",
  //             "FlagActive": "1",
  //             "LogLUDTimeUTC": "2024-06-03 03:51:40",
  //             "LogLUBy": "0317844394@INOS.VN",
  //             "ColCode": "C004",
  //             "ColCaption": "Chức vụ",
  //             "ColDataType": "TEXT",
  //             "FlagIsColDynamic": "1",
  //             "SqlOperatorType": "like",
  //             "mdmc_JsonListOption": "[]",
  //             "Lst_MD_OptionValue": null
  //           },
  //           {
  //             "OrgID": "7206207001",
  //             "ColGrpCodeSys": "COLGRPCODESYS.2023.01",
  //             "ColCodeSys": "C007",
  //             "NetworkID": "7206207001",
  //             "ColOperatorType": "EQUAL",
  //             "OrderIdx": 7,
  //             "JsonRenderParams": null,
  //             "JsonListOption": null,
  //             "FlagIsNotNull": "0",
  //             "FlagIsCheckDuplicate": "0",
  //             "FlagIsQuery": "0",
  //             "FlagActive": "1",
  //             "LogLUDTimeUTC": "2024-06-03 03:51:40",
  //             "LogLUBy": "0317844394@INOS.VN",
  //             "ColCode": "C006",
  //             "ColCaption": "Giới tính",
  //             "ColDataType": "SELECTONERADIO",
  //             "FlagIsColDynamic": "1",
  //             "SqlOperatorType": "=",
  //             "mdmc_JsonListOption":
  //                 "[{\"Value\":\"Male\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":0},{\"Value\":\"Female\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":1},{\"Value\":\"Other\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":2},{\"Value\":\" \",\"IsSelected\":true,\"id\":\"\",\"OrderIdx\":3}]",
  //             "Lst_MD_OptionValue": null
  //           },
  //           {
  //             "OrgID": "7206207001",
  //             "ColGrpCodeSys": "COLGRPCODESYS.2023.01",
  //             "ColCodeSys": "C009",
  //             "NetworkID": "7206207001",
  //             "ColOperatorType": "RANGE",
  //             "OrderIdx": 9,
  //             "JsonRenderParams": null,
  //             "JsonListOption": null,
  //             "FlagIsNotNull": "0",
  //             "FlagIsCheckDuplicate": "0",
  //             "FlagIsQuery": "0",
  //             "FlagActive": "1",
  //             "LogLUDTimeUTC": "2024-06-03 03:51:40",
  //             "LogLUBy": "0317844394@INOS.VN",
  //             "ColCode": "C008",
  //             "ColCaption": "Ngày sinh",
  //             "ColDataType": "DATE",
  //             "FlagIsColDynamic": "1",
  //             "SqlOperatorType": "=>;<=",
  //             "mdmc_JsonListOption": "[]",
  //             "Lst_MD_OptionValue": null
  //           }
  //         ]
  //       },
  //       "_dicExcs": {},
  //       "_dicDebug": {}
  //     }
  //   };
  //   if (response == null) {
  //     throw const ApiException(Message: 'No data');
  //   } else {
  //     final res = ClientgateModel.fromJsonObjDataList(
  //       response['Data']! as DataMap,
  //       (data) => MDMetaColGroupSpecSearchModel.fromMap(data as DataMap),
  //     );
  //     return res;
  //   }
  // }

  Future<ClientgateModel<void>> postChange(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
        path: path, headers: getHeaders()!, params: params);
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      throw const ApiException(Message: 'Success');
    }
  }

  Future<ClientgateModel<List<RT_ES_WarrrantyActivateByQRModel>>>
      postGetInputBySerialNo({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => (data as List)
            .map((e) => RT_ES_WarrrantyActivateByQRModel.fromJson(e as DataMap))
            .toList(),
      );
      return res;
    }
  }

  Future<ClientgateModel<RT_ES_WarrantyDetailModel?>> postCreate(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      if (response['Data']['_strErrCode'] != '0') {
        return ClientgateModel.fromJsonObjData(
          response['Data'] as DataMap,
          (data) => null,
        );
      }
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => RT_ES_WarrantyDetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  // RO

  Future<ClientgateModel<List<ES_RODetailModel>>> postSearchRO(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjDataList(
        response['Data'] as DataMap,
        (data) => (data as List)
            .map((e) => ES_RODetailModel.fromJson(e as DataMap))
            .toList(),
      );
      return res;
    }
  }

  Future<ClientgateModel<RT_ES_RODetailModel>> postGetByRONo(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => RT_ES_RODetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  Future<ClientgateModel<List<ES_ROErrorTypeModel>>> postSearchErrorType(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjDataList(
        response['Data'] as DataMap,
        (data) => (data as List)
            .map((e) => ES_ROErrorTypeModel.fromJson(e as DataMap))
            .toList(),
      );
      return res;
    }
  }

  Future<ClientgateModel<List<ES_ROProductModel>>> postSearchProduct(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjDataList(
        response['Data'] as DataMap,
        (data) => (data as List)
            .map((e) => ES_ROProductModel.fromJson(e as DataMap))
            .toList(),
      );
      return res;
    }
  }

  Future<ClientgateModel<RT_ES_ROErrorComponentModel>> postSearchErrorComponent(
      {required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: getHeaders()!,
      params: params,
    );
    if (response == null) {
      throw const ApiException(Message: 'No data');
    } else {
      final res = ClientgateModel.fromJsonObjData(
        response['Data'] as DataMap,
        (data) => RT_ES_ROErrorComponentModel.fromJson(data as DataMap),
      );
      return res;
    }
  }
}
