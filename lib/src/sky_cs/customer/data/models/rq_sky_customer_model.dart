

import 'package:ecore/src/sky_cs/customer/data/models/rq_sky_gov_id_model.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_customer.dart';

class RQ_SKY_CustomerModel extends RQ_SKY_Customer {
  RQ_SKY_CustomerModel({required super.CountryCodeContact, required super.CountryCodeDelivery, required super.CountryCodeInvoice, required super.CreateBy, required super.CreateDTimeUTC, required super.CustomerCode, required super.CustomerCodeInvoice, required super.CustomerCodeSysERP, required super.CustomerName, required super.CustomerType, required super.FlagAllUserManager, required super.GovID, required super.OrgID, required super.NetworkID, required super.JsonCustomerInfo});

  factory RQ_SKY_CustomerModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_CustomerModel(
      CountryCodeContact: json['CountryCodeContact'] as String? ?? '',
      CountryCodeDelivery: json['CountryCodeDelivery'] as String? ?? '',
      CountryCodeInvoice: json['CountryCodeInvoice'] as String? ?? '',
      CreateBy: json['CreateBy'] as String? ?? '',
      CreateDTimeUTC: json['CreateDTimeUTC'] as String? ?? '',
      CustomerCode: json['CustomerCode'] as String? ?? '',
      CustomerCodeInvoice: json['CustomerCodeInvoice'] as String? ?? '',
      CustomerCodeSysERP: json['CustomerCodeSysERP'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      CustomerType: json['CustomerType'] as String? ?? '',
      FlagAllUserManager: json['FlagAllUserManager'] as String? ?? '',
      GovID: json['GovID'] as List<RQ_SKY_GovIDModel>? ?? [],
      OrgID: json['OrgID'] as int? ?? 0,
      NetworkID: json['NetworkID'] as int? ?? 0,
      JsonCustomerInfo: json['JsonCustomerInfo'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CountryCodeContact': CountryCodeContact,
      'CountryCodeDelivery': CountryCodeDelivery,
      'CountryCodeInvoice': CountryCodeInvoice,
      'CreateBy': CreateBy,
      'CreateDTimeUTC': CreateDTimeUTC,
      'CustomerCode': CustomerCode,
      'CustomerCodeInvoice': CustomerCodeInvoice,
      'CustomerCodeSysERP': CustomerCodeSysERP,
      'CustomerName': CustomerName,
      'CustomerType': CustomerType,
      'FlagAllUserManager': FlagAllUserManager,
      'GovID': GovID,
      'OrgID': OrgID,
      'NetworkID': NetworkID,
      'JsonCustomerInfo': JsonCustomerInfo,
    };
  }
}