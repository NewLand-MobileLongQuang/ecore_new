import 'package:equatable/equatable.dart';

class SKY_CustomerCpnCampaignCustomer extends Equatable {
  const SKY_CustomerCpnCampaignCustomer({required this.CampaignCode, required this.OrgID, required this.AgentCode, required this.JsonCustomerInfo, required this.CustomerCodeSys, required this.LogLUDTimeUTC, required this.LogLUBy, required this.CustomerName, required this.CustomerPhoneNo1, required this.CustomerPhoneNo2, required this.CustomerEmail, required this.CustomerAddress, required this.CustomerCompany, required this.CampaignCustomerStatus, required this.CustomerPhoneNo, required this.CallOutDTimeUTC, required this.CallTime, required this.RecordFilePath, required this.CampaignCustomerCallStatus, required this.CustomerFeedBack, required this.Remark, required this.AgentName, required this.CampaignName, required this.CampaignStatus, required this.CampaignTypeName, required this.cc_CreateDTimeUTC, required this.cc_CreateBy, required this.CampaignTypeCode, required this.CustomerAvatarName, required this.CustomerAvatarPath, required this.CustomerCode, required this.CallID, required this.CpnCustomerSaveType});

  final String CampaignCode;
  final String OrgID;
  final String AgentCode;
  final String JsonCustomerInfo;
  final String CustomerCodeSys;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String CustomerName;
  final String CustomerPhoneNo1;
  final String CustomerPhoneNo2;
  final String CustomerEmail;
  final String CustomerAddress;
  final String CustomerCompany;
  final String CampaignCustomerStatus;
  final String CustomerPhoneNo;
  final String CallOutDTimeUTC;
  final String CallTime;
  final String RecordFilePath;
  final String CampaignCustomerCallStatus;
  final String CustomerFeedBack;
  final String Remark;
  final String AgentName;
  final String CampaignName;
  final String CampaignStatus;
  final String CampaignTypeName;
  final String cc_CreateDTimeUTC;
  final String cc_CreateBy;
  final String CampaignTypeCode;
  final String CustomerAvatarName;
  final String CustomerAvatarPath;
  final String CustomerCode;
  final String CallID;
  final String CpnCustomerSaveType;

  @override
  List<Object?> get props => [
    CampaignCode,
    OrgID,
    AgentCode,
    JsonCustomerInfo,
    CustomerCodeSys,
    LogLUDTimeUTC,
    LogLUBy,
    CustomerName,
    CustomerPhoneNo1,
    CustomerPhoneNo2,
    CustomerEmail,
    CustomerAddress,
    CustomerCompany,
    CampaignCustomerStatus,
    CustomerPhoneNo,
    CallOutDTimeUTC,
    CallTime,
    RecordFilePath,
    CampaignCustomerCallStatus,
    CustomerFeedBack,
    Remark,
    AgentName,
    CampaignName,
    CampaignStatus,
    CampaignTypeName,
    cc_CreateDTimeUTC,
    cc_CreateBy,
    CampaignTypeCode,
    CustomerAvatarName,
    CustomerAvatarPath,
    CustomerCode,
    CallID,
    CpnCustomerSaveType,
  ];
}