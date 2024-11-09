import '../../domain/entities/es_ro_error_type.dart';

class ES_ROErrorTypeModel extends ES_ROErrorType {
  ES_ROErrorTypeModel({required super.OrgID, required super.ErrorTypeCode, required super.NetworkID, required super.ErrorTypeName, required super.ErrorTypeDesc, required super.NetworkErrorTypeCode, required super.FlagActive, required super.DTimeUsed, required super.LogLUDTimeUTC, required super.LogLUBy});

  factory ES_ROErrorTypeModel.fromMap(Map<String, dynamic> json) {
    return ES_ROErrorTypeModel(
      OrgID: json['OrgID'] as String? ?? '',
      ErrorTypeCode: json['ErrorTypeCode'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      ErrorTypeName: json['ErrorTypeName'] as String? ?? '',
      ErrorTypeDesc: json['ErrorTypeDesc'] as String? ?? '',
      NetworkErrorTypeCode: json['NetworkErrorTypeCode'] as String? ?? '',
      FlagActive: json['FlagActive'] as String? ?? '',
      DTimeUsed: json['DTimeUsed'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': OrgID,
      'ErrorTypeCode': ErrorTypeCode,
      'NetworkID': NetworkID,
      'ErrorTypeName': ErrorTypeName,
      'ErrorTypeDesc': ErrorTypeDesc,
      'NetworkErrorTypeCode': NetworkErrorTypeCode,
      'FlagActive': FlagActive,
      'DTimeUsed': DTimeUsed,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}