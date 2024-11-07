import 'dart:convert';

import '../../utils/typedef.dart';

class ClientGateModel <T> {
  ClientGateModel({
    required this.strTId,
    required this.strAppTId,
    required this.objTTime,
    required this.strType,
    required this.strErrCode,
    required this.objResult,
  });

  factory ClientGateModel.fromJson(String source) =>
      ClientGateModel.fromMap(jsonDecode(source) as DataMap);



  ClientGateModel.fromMap(DataMap map)
      : this(
    objResult: map.containsKey('_objResult') ? map['_objResult'] as dynamic? : null,
    strTId: map['_strTId'] as String? ?? '',
    strAppTId: map['_strAppTId'] as String? ?? '',
    objTTime: map['_objTTime'] as String? ?? '',
    strType: map['_strType'] as String? ?? '',
    strErrCode: map['_strErrCode'] as String? ?? '',
  );

  final String strTId;
  final String strAppTId;
  final String objTTime;
  final String strType;
  final String strErrCode;
  final dynamic? objResult;

}



class ClientgateModel <T> {
  ClientgateModel({
    required this.strTId,
    required this.strAppTId,
    required this.objTTime,
    required this.strType,
    required this.strErrCode,
    required this.objResult,
  });

  factory ClientgateModel.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic) create,
      ) {
    return ClientgateModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: create(json['_objResult']),
    );
  }

  factory ClientgateModel.fromJsonClient(
      Map<String, dynamic> json,
      T Function(dynamic) create,
      ) {
    return ClientgateModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: create(json['_objResult']['Data']['Sys_User']),
    );
  }

  factory ClientgateModel.fromJsonObjDataList(
      Map<String, dynamic> json,
      T Function(dynamic) create,
      ) {
    return ClientgateModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: create(json['_objResult']['DataList']),
    );
  }

  factory ClientgateModel.fromJsonObjData(
      Map<String, dynamic> json,
      T Function(dynamic) create,
      ) {
    return ClientgateModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: create(json['_objResult']['Data']),
    );
  }

  final String strTId;
  final String strAppTId;
  final String objTTime;
  final String strType;
  final String strErrCode;
  final T? objResult;
  List<T> getDataList<T>(T Function(dynamic) fromMap) {
    final dataList = objResult as List<dynamic>? ?? [];
    return dataList.map(fromMap).toList();
  }
}