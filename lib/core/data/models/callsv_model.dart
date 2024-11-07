import 'dart:convert';

import '../../utils/typedef.dart';

class CallSvDataModel {
  factory CallSvDataModel.fromJson(String source) =>
      CallSvDataModel.fromMap(jsonDecode(source) as DataMap);

  CallSvDataModel.fromMap(DataMap map)
      : this(
    DataMapData: map.containsKey('Data') ? map['Data'] as dynamic? : null,
    Success: map['Success'] as bool,
    ErrorMessage: map.containsKey('ErrorMessage')
        ? map['ErrorMessage'] as String?
        : '',
    ErrorCode:
    map.containsKey('ErrorCode') ? map['ErrorCode'] as String? : '',
    ErrorDetail: map.containsKey('ErrorDetail')
        ? map['ErrorDetail'] as String?
        : '',
  );
  const CallSvDataModel(
      {this.DataMapData = null,
        required this.Success,
        required this.ErrorMessage,
        required this.ErrorCode,
        this.ErrorDetail = ''});

  final dynamic? DataMapData;
  final bool Success;
  final String? ErrorMessage;
  final String? ErrorCode;
  final String? ErrorDetail;
}
