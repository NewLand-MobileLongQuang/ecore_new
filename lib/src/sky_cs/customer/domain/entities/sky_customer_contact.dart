import 'package:equatable/equatable.dart';

class SKY_CustomerContact extends Equatable {
  SKY_CustomerContact({required this.OrgID, required this.CustomerCodeSys, required this.CustomerCodeSysContact, required this.NetworkID, required this.FlagActive, required this.LogLUDTimeUTC, required this.LogLUBy, required this.mcc_CustomerCodeSys, required this.mcc_CustomerCode, required this.mcc_CustomerName, required this.mcc_CustomerNameEN, required this.mcc_CustomerAvatarName, required this.mcc_CustomerAvatarPath, required this.mcc_JsonCustomerInfo, required this.mcc_CustomerPhoneJson, required this.mcc_CustomerEmailJson});

  final String OrgID;
  final String CustomerCodeSys;
  final String CustomerCodeSysContact;
  final String NetworkID;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String mcc_CustomerCodeSys;
  final String mcc_CustomerCode;
  final String mcc_CustomerName;
  final String mcc_CustomerNameEN;
  final String mcc_CustomerAvatarName;
  final String mcc_CustomerAvatarPath;
  final String mcc_JsonCustomerInfo;
  final String mcc_CustomerPhoneJson;
  final String mcc_CustomerEmailJson;

  @override
  List<Object?> get props => [OrgID, CustomerCodeSys, CustomerCodeSysContact, NetworkID, FlagActive, LogLUDTimeUTC, LogLUBy, mcc_CustomerCodeSys, mcc_CustomerCode, mcc_CustomerName, mcc_CustomerNameEN, mcc_CustomerAvatarName, mcc_CustomerAvatarPath, mcc_JsonCustomerInfo, mcc_CustomerPhoneJson, mcc_CustomerEmailJson];
}