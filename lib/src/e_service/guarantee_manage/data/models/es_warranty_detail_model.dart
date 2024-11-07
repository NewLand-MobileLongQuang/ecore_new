import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';

class ES_WarrantyDetailModel extends ES_WarrantyDetail {
  ES_WarrantyDetailModel({
    required super.WarrantyNo,
    required super.OrgID,
    required super.NetworkID,
    required super.SerialNo,
    required super.ProductCode,
    required super.ProductCodeUser,
    required super.ProductName,
    required super.ProductionDTimeUTC,
    required super.FactoryCode,
    required super.KCS,
    required super.CustomerCodeSys,
    required super.CustomerName,
    required super.CustomerPhoneNo,
    required super.CustomerAddress,
    required super.CustomerEmail,
    required super.AgentCode,
    required super.InstallationDTimeUTC,
    required super.WarrantyDTimeUTC,
    required super.WarrantyExpDTimeUTC,
    required super.CreateDTimeUTC,
    required super.CreateBy,
    required super.WarrantyStatus,
    required super.Remark,
    required super.LUDTimeUTC,
    required super.LUBy,
    required super.LogLUDTimeUTC,
    required super.LogLUBy,
  });

  factory ES_WarrantyDetailModel.fromJson(Map<String, dynamic> map) {
    return ES_WarrantyDetailModel(
      WarrantyNo: map['WarrantyNo'] as String? ?? '',
      OrgID: map['OrgID'] as String? ?? '',
      NetworkID: map['NetworkID'] as String? ?? '',
      SerialNo: map['SerialNo'] as String? ?? '',
      ProductCode: map['ProductCode'] as String? ?? '',
      ProductCodeUser: map['ProductCodeUser'] as String? ?? '',
      ProductName: map['ProductName'] as String? ?? '',
      ProductionDTimeUTC: map['ProductionDTimeUTC'] as String? ?? '',
      FactoryCode: map['FactoryCode'] as String? ?? '',
      KCS: map['KCS'] as String? ?? '',
      CustomerCodeSys: map['CustomerCodeSys'] as String? ?? '',
      CustomerName: map['CustomerName'] as String? ?? '',
      CustomerPhoneNo: map['CustomerPhoneNo'] as String? ?? '',
      CustomerAddress: map['CustomerAddress'] as String? ?? '',
      CustomerEmail: map['CustomerEmail'] as String? ?? '',
      AgentCode: map['AgentCode'] as String? ?? '',
      InstallationDTimeUTC: map['InstallationDTimeUTC'] as String? ?? '',
      WarrantyDTimeUTC: map['WarrantyDTimeUTC'] as String? ?? '',
      WarrantyExpDTimeUTC: map['WarrantyExpDTimeUTC'] as String? ?? '',
      CreateDTimeUTC: map['CreateDTimeUTC'] as String? ?? '',
      CreateBy: map['CreateBy'] as String? ?? '',
      WarrantyStatus: map['WarrantyStatus'] as String? ?? '',
      Remark: map['Remark'] as String? ?? '',
      LUDTimeUTC: map['LUDTimeUTC'] as String? ?? '',
      LUBy: map['LUBy'] as String? ?? '',
      LogLUDTimeUTC: map['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: map['LogLUBy'] as String? ?? '',
    );
  }


}