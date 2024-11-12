import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_hist.dart';
class SKY_CustomerHistModel extends SKY_CustomerHist {
  SKY_CustomerHistModel({required super.AutoId, required super.OrgID, required super.CustomerCodeSys, required super.NetworkID, required super.JsonCustomerInfoHist, required super.LUDTimeUTC, required super.LUBy, required super.LUByName, required super.LogLUDTimeUTC, required super.LogLUBy});

  factory SKY_CustomerHistModel.fromMap(Map<String, dynamic> json) {
    return SKY_CustomerHistModel(
      AutoId: json['AutoId'] as int? ?? 0,
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      JsonCustomerInfoHist: json['JsonCustomerInfoHist'] as String? ?? '',
      LUDTimeUTC: json['LUDTimeUTC'] as String? ?? '',
      LUBy: json['LUBy'] as String? ?? '',
      LUByName: json['LUByName'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'AutoId': AutoId,
      'OrgID': OrgID,
      'CustomerCodeSys': CustomerCodeSys,
      'NetworkID': NetworkID,
      'JsonCustomerInfoHist': JsonCustomerInfoHist,
      'LUDTimeUTC': LUDTimeUTC,
      'LUBy': LUBy,
      'LUByName': LUByName,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}