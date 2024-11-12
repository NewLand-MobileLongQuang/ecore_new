import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_gov_id.dart';
import 'package:equatable/equatable.dart';

class RQ_SKY_Customer extends Equatable {
  RQ_SKY_Customer({required this.CountryCodeContact, required this.CountryCodeDelivery, required this.CountryCodeInvoice, required this.CreateBy, required this.CreateDTimeUTC, required this.CustomerCode, required this.CustomerCodeInvoice, required this.CustomerCodeSysERP, required this.CustomerName, required this.CustomerType, required this.FlagAllUserManager, required this.GovID, required this.OrgID, required this.NetworkID, required this.JsonCustomerInfo});

  final String CountryCodeContact;
  final String CountryCodeDelivery;
  final String CountryCodeInvoice;
  final String CreateBy;
  final String CreateDTimeUTC;
  final String CustomerCode;
  final String CustomerCodeInvoice;
  final String CustomerCodeSysERP;
  final String CustomerName;
  final String CustomerType;
  final String FlagAllUserManager;
  final List<RQ_SKY_GovID> GovID;
  final int OrgID;
  final int NetworkID;
  final String JsonCustomerInfo;

  @override
  List<Object?> get props => [CountryCodeContact, CountryCodeDelivery, CountryCodeInvoice, CreateBy, CreateDTimeUTC, CustomerCode, CustomerCodeInvoice, CustomerCodeSysERP, CustomerName, CustomerType, FlagAllUserManager, GovID, OrgID, NetworkID, JsonCustomerInfo];

}