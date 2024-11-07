import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_create.dart';

class ES_WarrantyCreateModel extends ES_WarrantyCreate {
  ES_WarrantyCreateModel({required super.OrgID, required super.SerialNo, required super.ProductCode, required super.ProductionDTimeUTC, required super.FactoryCode, required super.KCS, required super.CustomerCodeSys, required super.CustomerName, required super.CustomerPhoneNo, required super.CustomerAddress, required super.CustomerEmail, required super.AgentCode, required super.InstallationDTimeUTC, required super.WarrantyDTimeUTC, required super.WarrantyExpDTimeUTC, required super.Remark});

  factory ES_WarrantyCreateModel.fromJson(Map<String, dynamic> json) {
    return ES_WarrantyCreateModel(
      OrgID: json['OrgID'] as String? ?? '',
      SerialNo: json['SerialNo'] as String? ?? '',
      ProductCode: json['ProductCode'] as String? ?? '',
      ProductionDTimeUTC: json['ProductionDTimeUTC'] as String? ?? '',
      FactoryCode: json['FactoryCode'] as String? ?? '',
      KCS: json['KCS'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      CustomerPhoneNo: json['CustomerPhoneNo'] as String? ?? '',
      CustomerAddress: json['CustomerAddress'] as String? ?? '',
      CustomerEmail: json['CustomerEmail'] as String? ?? '',
      AgentCode: json['AgentCode'] as String? ?? '',
      InstallationDTimeUTC: json['InstallationDTimeUTC'] as String? ?? '',
      WarrantyDTimeUTC: json['WarrantyDTimeUTC'] as String? ?? '',
      WarrantyExpDTimeUTC: json['WarrantyExpDTimeUTC'] as String? ?? '',
      Remark: json['Remark'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': OrgID,
      'SerialNo': SerialNo,
      'ProductCode': ProductCode,
      'ProductionDTimeUTC': ProductionDTimeUTC,
      'FactoryCode': FactoryCode,
      'KCS': KCS,
      'CustomerCodeSys': CustomerCodeSys,
      'CustomerName': CustomerName,
      'CustomerPhoneNo': CustomerPhoneNo,
      'CustomerAddress': CustomerAddress,
      'CustomerEmail': CustomerEmail,
      'AgentCode': AgentCode,
      'InstallationDTimeUTC': InstallationDTimeUTC,
      'WarrantyDTimeUTC': WarrantyDTimeUTC,
      'WarrantyExpDTimeUTC': WarrantyExpDTimeUTC,
      'Remark': Remark,
    };
  }
}