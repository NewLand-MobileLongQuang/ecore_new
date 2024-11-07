import 'package:equatable/equatable.dart';

class ES_WarrantyDetail extends Equatable {
  ES_WarrantyDetail({
    required this.WarrantyNo,
    required this.OrgID,
    required this.NetworkID,
    required this.SerialNo,
    required this.ProductCode,
    required this.ProductCodeUser,
    required this.ProductName,
    required this.ProductionDTimeUTC,
    required this.FactoryCode,
    required this.KCS,
    required this.CustomerCodeSys,
    required this.CustomerName,
    required this.CustomerPhoneNo,
    required this.CustomerAddress,
    required this.CustomerEmail,
    required this.AgentCode,
    required this.InstallationDTimeUTC,
    required this.WarrantyDTimeUTC,
    required this.WarrantyExpDTimeUTC,
    required this.CreateDTimeUTC,
    required this.CreateBy,
    required this.WarrantyStatus,
    required this.Remark,
    required this.LUDTimeUTC,
    required this.LUBy,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  final String WarrantyNo;
  final String OrgID;
  final String NetworkID;
  final String SerialNo;
  final String ProductCode;
  final String ProductCodeUser;
  final String ProductName;
  final String ProductionDTimeUTC;
  final String FactoryCode;
  final String KCS;
  String CustomerCodeSys;
  String CustomerName;
  String CustomerPhoneNo;
  String CustomerAddress;
  String CustomerEmail;
  final String AgentCode;
  final String InstallationDTimeUTC;
  String WarrantyDTimeUTC;
  String WarrantyExpDTimeUTC;
  final String CreateDTimeUTC;
  final String CreateBy;
  final String WarrantyStatus;
  String Remark;
  final String LUDTimeUTC;
  final String LUBy;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    WarrantyNo,
    OrgID,
    NetworkID,
    SerialNo,
    ProductCode,
    ProductCodeUser,
    ProductName,
    ProductionDTimeUTC,
    FactoryCode,
    KCS,
    CustomerCodeSys,
    CustomerName,
    CustomerPhoneNo,
    CustomerAddress,
    CustomerEmail,
    AgentCode,
    InstallationDTimeUTC,
    WarrantyDTimeUTC,
    WarrantyExpDTimeUTC,
    CreateDTimeUTC,
    CreateBy,
    WarrantyStatus,
    Remark,
    LUDTimeUTC,
    LUBy,
    LogLUDTimeUTC,
    LogLUBy,];
}