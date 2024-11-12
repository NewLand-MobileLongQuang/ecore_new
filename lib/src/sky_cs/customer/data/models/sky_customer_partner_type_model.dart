import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_partner_type.dart';

class SKY_CustomerPartnerTypeModel extends SKY_CustomerPartnerType {
  SKY_CustomerPartnerTypeModel({required super.PartnerType, required super.PartnerTypeName, required super.NetworkID, required super.FlagActive, required super.LogLUDTimeUTC, required super.LogLUBy});

  factory SKY_CustomerPartnerTypeModel.fromMap(Map<String, dynamic> json) {
    return SKY_CustomerPartnerTypeModel(
      PartnerType: json['PartnerType'] as String? ?? '',
      PartnerTypeName: json['PartnerTypeName'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      FlagActive: json['FlagActive'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'PartnerType': PartnerType,
      'PartnerTypeName': PartnerTypeName,
      'NetworkID': NetworkID,
      'FlagActive': FlagActive,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}