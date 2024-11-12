import 'package:equatable/equatable.dart';

class SKY_CustomerInfo extends Equatable {
  SKY_CustomerInfo({required this.OrgID, required this.CustomerCodeSys, required this.NetworkID, required this.CustomerCode, required this.CustomerCodeInvoice, required this.CustomerType, required this.CustomerGrpCode, required this.CustomerSourceCode, required this.CustomerName, required this.CustomerNameEN, required this.CustomerGender, required this.CustomerPhoneNo, required this.CustomerMobilePhone, required this.ProvinceCode, required this.DistrictCode, required this.WardCode, required this.AreaCode, required this.CustomerAvatarName, required this.CustomerAvatarSpec, required this.FlagCustomerAvatarPath, required this.CustomerAvatarPath, required this.JsonCustomerInfo, required this.MyXml, required this.FlagAllUserManager, required this.CustomerAddress, required this.CustomerEmail, required this.CustomerDateOfBirth, required this.GovIDType, required this.GovIDCardNo, required this.GovIDCardDate, required this.GovIDCardPlace, required this.TaxCode, required this.BankCode, required this.BankName, required this.BankAccountNo, required this.RepresentName, required this.RepresentPosition, required this.UserCodeOwner, required this.ContactName, required this.ContactPhone, required this.ContactEmail, required this.Fax, required this.Facebook, required this.InvoiceCustomerName, required this.InvoiceCustomerAddress, required this.InvoiceOrgName, required this.InvoiceEmailSend, required this.MST, required this.ListOfCustDynamicFieldValue, required this.FlagDealer, required this.FlagSupplier, required this.FlagEndUser, required this.FlagShipper, required this.FlagBank, required this.FlagInsurrance, required this.DTimeUsed, required this.CreateDTimeUTC, required this.CreateBy, required this.LUDTimeUTC, required this.LUBy, required this.FlagActive, required this.Remark, required this.Coordinates, required this.LogLUDTimeUTC, required this.LogLUBy, required this.CustomerCodeSysERP, required this.mcerp_CustomerName, required this.PartnerType, required this.CustomerPhoneJson, required this.CustomerEmailJson, required this.CustomerZaloUserFollowerJson, required this.CustomerInCustomerGroupJson, required this.CustomerInPartnerTypeJson, required this.CustomerContactJson, required this.CustomerUserManagerJson, required this.CustomerGovIDJson, required this.Org_NNTFullName, required this.Network_NNTFullName, required this.mct_CustomerTypeName, required this.mpt_PartnerTypeName, required this.mcs_CustomerSourceName, required this.mp_ProvinceName, required this.md_DistrictName, required this.mw_WardName, required this.ma_AreaName, required this.mg_GovIDTypeName, required this.SolutionCode, required this.SolutionCodeCreate, required this.FunctionActionType, required this.ThirdPartyInfo, required this.CustomerNameContact, required this.CountryCodeContact, required this.ProvinceCodeContact, required this.DistrictCodeContact, required this.WardCodeContact, required this.CountryCodeInvoice, required this.ProvinceCodeInvoice, required this.DistrictCodeInvoice, required this.WardCodeInvoice, required this.CountryCodeDelivery, required this.ProvinceCodeDelivery, required this.DistrictCodeDelivery, required this.WardCodeDelivery, required this.mctcontact_CountryName, required this.mpcontact_ProvinceName, required this.mdtcontact_DistrictName, required this.mwcontact_WardName, required this.mctinvoice_CountryName, required this.mpinvoice_ProvinceName, required this.mdtinvoice_DistrictName, required this.mwinvoice_WardName, required this.mctdelivery_CountryName, required this.mpdelivery_ProvinceName, required this.mdtdelivery_DistrictName, required this.mwdelivery_WardName, required this.su_UserName, required this.Setting});

  final String OrgID;
  final String CustomerCodeSys;
  final String NetworkID;
  final String CustomerCode;
  final String CustomerCodeInvoice;
  final String CustomerType;
  final String CustomerGrpCode;
  final String CustomerSourceCode;
  final String CustomerName;
  final String CustomerNameEN;
  final String CustomerGender;
  final String CustomerPhoneNo;
  final String CustomerMobilePhone;
  final String ProvinceCode;
  final String DistrictCode;
  final String WardCode;
  final String AreaCode;
  final String CustomerAvatarName;
  final String CustomerAvatarSpec;
  final String FlagCustomerAvatarPath;
  final String CustomerAvatarPath;
  final String JsonCustomerInfo;
  final String MyXml;
  final String FlagAllUserManager;
  final String CustomerAddress;
  final String CustomerEmail;
  final String CustomerDateOfBirth;
  final String GovIDType;
  final String GovIDCardNo;
  final String GovIDCardDate;
  final String GovIDCardPlace;
  final String TaxCode;
  final String BankCode;
  final String BankName;
  final String BankAccountNo;
  final String RepresentName;
  final String RepresentPosition;
  final String UserCodeOwner;
  final String ContactName;
  final String ContactPhone;
  final String ContactEmail;
  final String Fax;
  final String Facebook;
  final String InvoiceCustomerName;
  final String InvoiceCustomerAddress;
  final String InvoiceOrgName;
  final String InvoiceEmailSend;
  final String MST;
  final String ListOfCustDynamicFieldValue;
  final String FlagDealer;
  final String FlagSupplier;
  final String FlagEndUser;
  final String FlagShipper;
  final String FlagBank;
  final String FlagInsurrance;
  final String DTimeUsed;
  final String CreateDTimeUTC;
  final String CreateBy;
  final String LUDTimeUTC;
  final String LUBy;
  final String FlagActive;
  final String Remark;
  final String Coordinates;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String CustomerCodeSysERP;
  final String mcerp_CustomerName;
  final String PartnerType;
  final String CustomerPhoneJson;
  final String CustomerEmailJson;
  final String CustomerZaloUserFollowerJson;
  final String CustomerInCustomerGroupJson;
  final String CustomerInPartnerTypeJson;
  final String CustomerContactJson;
  final String CustomerUserManagerJson;
  final String CustomerGovIDJson;
  final String Org_NNTFullName;
  final String Network_NNTFullName;
  final String mct_CustomerTypeName;
  final String mpt_PartnerTypeName;
  final String mcs_CustomerSourceName;
  final String mp_ProvinceName;
  final String md_DistrictName;
  final String mw_WardName;
  final String ma_AreaName;
  final String mg_GovIDTypeName;
  final String SolutionCode;
  final String SolutionCodeCreate;
  final String FunctionActionType;
  final String ThirdPartyInfo;
  final String CustomerNameContact;
  final String CountryCodeContact;
  final String ProvinceCodeContact;
  final String DistrictCodeContact;
  final String WardCodeContact;
  final String CountryCodeInvoice;
  final String ProvinceCodeInvoice;
  final String DistrictCodeInvoice;
  final String WardCodeInvoice;
  final String CountryCodeDelivery;
  final String ProvinceCodeDelivery;
  final String DistrictCodeDelivery;
  final String WardCodeDelivery;
  final String mctcontact_CountryName;
  final String mpcontact_ProvinceName;
  final String mdtcontact_DistrictName;
  final String mwcontact_WardName;
  final String mctinvoice_CountryName;
  final String mpinvoice_ProvinceName;
  final String mdtinvoice_DistrictName;
  final String mwinvoice_WardName;
  final String mctdelivery_CountryName;
  final String mpdelivery_ProvinceName;
  final String mdtdelivery_DistrictName;
  final String mwdelivery_WardName;
  final String su_UserName;
  final String Setting;
  //final String CustomDataDict;

  @override
  List<Object?> get props => [
    OrgID,
    CustomerCodeSys,
    NetworkID,
    CustomerCode,
    CustomerCodeInvoice,
    CustomerType,
    CustomerGrpCode,
    CustomerSourceCode,
    CustomerName,
    CustomerNameEN,
    CustomerGender,
    CustomerPhoneNo,
    CustomerMobilePhone,
    ProvinceCode,
    DistrictCode,
    WardCode,
    AreaCode,
    CustomerAvatarName,
    CustomerAvatarSpec,
    FlagCustomerAvatarPath,
    CustomerAvatarPath,
    JsonCustomerInfo,
    MyXml,
    FlagAllUserManager,
    CustomerAddress,
    CustomerEmail,
    CustomerDateOfBirth,
    GovIDType,
    GovIDCardNo,
    GovIDCardDate,
    GovIDCardPlace,
    TaxCode,
    BankCode,
    BankName,
    BankAccountNo,
    RepresentName,
    RepresentPosition,
    UserCodeOwner,
    ContactName,
    ContactPhone,
    ContactEmail,
    Fax,
    Facebook,
    InvoiceCustomerName,
    InvoiceCustomerAddress,
    InvoiceOrgName,
    InvoiceEmailSend,
    MST,
    ListOfCustDynamicFieldValue,
    FlagDealer,
    FlagSupplier,
    FlagEndUser,
    FlagShipper,
    FlagBank,
    FlagInsurrance,
    DTimeUsed,
    CreateDTimeUTC,
    CreateBy,
    LUDTimeUTC,
    LUBy,
    FlagActive,
    Remark,
    Coordinates,
    LogLUDTimeUTC,
    LogLUBy,
    CustomerCodeSysERP,
    mcerp_CustomerName,
    PartnerType,
    CustomerPhoneJson,
    CustomerEmailJson,
    CustomerZaloUserFollowerJson,
    CustomerInCustomerGroupJson,
    CustomerInPartnerTypeJson,
    CustomerContactJson,
    CustomerUserManagerJson,
    CustomerGovIDJson,
    Org_NNTFullName,
    Network_NNTFullName,
    mct_CustomerTypeName,
    mpt_PartnerTypeName,
    mcs_CustomerSourceName,
    mp_ProvinceName,
    md_DistrictName,
    mw_WardName,
    ma_AreaName,
    mg_GovIDTypeName,
    SolutionCode,
    SolutionCodeCreate,
    FunctionActionType,
    ThirdPartyInfo,
    CustomerNameContact,
    CountryCodeContact,
    ProvinceCodeContact,
    DistrictCodeContact,
    WardCodeContact,
    CountryCodeInvoice,
    ProvinceCodeInvoice,
    DistrictCodeInvoice,
    WardCodeInvoice,
    CountryCodeDelivery,
    ProvinceCodeDelivery,
    DistrictCodeDelivery,
    WardCodeDelivery,
    mctcontact_CountryName,
    mpcontact_ProvinceName,
    mdtcontact_DistrictName,
    mwcontact_WardName,
    mctinvoice_CountryName,
    mpinvoice_ProvinceName,
    mdtinvoice_DistrictName,
    mwinvoice_WardName,
    mctdelivery_CountryName,
    mpdelivery_ProvinceName,
    mdtdelivery_DistrictName,
    mwdelivery_WardName,
    su_UserName,
    Setting,
   // CustomDataDict,
  ];

}