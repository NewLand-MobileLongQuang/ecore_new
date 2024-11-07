import 'package:equatable/equatable.dart';

class ES_WarrantyEdit extends Equatable{
  ES_WarrantyEdit({required this.WarrantyNo, required this.OrgID, required this.SerialNo, required this.ProductCode, required this.ProductionDTimeUTC, required this.FactoryCode, required this.KCS, required this.CustomerCodeSys, required this.CustomerName, required this.CustomerPhoneNo, required this.CustomerAddress, required this.CustomerEmail, required this.AgentCode, required this.InstallationDTimeUTC, required this.WarrantyDTimeUTC, required this.WarrantyExpDTimeUTC, required this.WarrantyStatus, required this.Remark});

  final String WarrantyNo;
  final String OrgID;
  final String SerialNo;
  final String ProductCode;
  final String ProductionDTimeUTC;
  final String FactoryCode;
  final String KCS;
  final String CustomerCodeSys;
  final String CustomerName;
  final String CustomerPhoneNo;
  final String CustomerAddress;
  final String CustomerEmail;
  final String AgentCode;
  final String InstallationDTimeUTC;
  final String WarrantyDTimeUTC;
  final String WarrantyExpDTimeUTC;
  final String WarrantyStatus;
  final String Remark;

  @override
  List<Object?> get props => [WarrantyNo, OrgID, SerialNo, ProductCode, ProductionDTimeUTC, FactoryCode, KCS, CustomerCodeSys, CustomerName, CustomerPhoneNo, CustomerAddress, CustomerEmail, AgentCode, InstallationDTimeUTC, WarrantyDTimeUTC, WarrantyExpDTimeUTC, WarrantyStatus, Remark];

  Map<String, dynamic> toJson() {
    return {
      'WarrantyNo': WarrantyNo,
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
      'WarrantyStatus': WarrantyStatus,
      'Remark': Remark,
    };
  }
}