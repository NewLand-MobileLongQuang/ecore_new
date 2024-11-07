class MDMetaColGroupSpecSearchModel {
  final String strTId;
  final String strAppTId;
  final String objTTime;
  final String strType;
  final String strErrCode;
  final Result objResult;

  MDMetaColGroupSpecSearchModel({
    required this.strTId,
    required this.strAppTId,
    required this.objTTime,
    required this.strType,
    required this.strErrCode,
    required this.objResult,
  });

  factory MDMetaColGroupSpecSearchModel.fromMap(Map<String, dynamic> json) {
    return MDMetaColGroupSpecSearchModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: Result.fromMap(json['_objResult'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_strTId': strTId,
      '_strAppTId': strAppTId,
      '_objTTime': objTTime,
      '_strType': strType,
      '_strErrCode': strErrCode,
      '_objResult': objResult.toMap(),
    };
  }
}


class Result {
  final int pageIndex;
  final int pageSize;
  final int pageCount;
  final int itemCount;
  final List<DataList> dataList;

  Result({
    required this.pageIndex,
    required this.pageSize,
    required this.pageCount,
    required this.itemCount,
    required this.dataList,
  });

  factory Result.fromMap(Map<String, dynamic> json) {
    return Result(
      pageIndex: json['PageIndex'] as int? ?? 0,
      pageSize: json['PageSize'] as int? ?? 0,
      pageCount: json['PageCount'] as int? ?? 0,
      itemCount: json['ItemCount'] as int? ?? 0,
      dataList: (json['DataList'] as List<dynamic>)
          .map((item) => DataList.fromMap(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'PageIndex': pageIndex,
      'PageSize': pageSize,
      'PageCount': pageCount,
      'ItemCount': itemCount,
      'DataList': dataList.map((item) => item.toMap()).toList(),
    };
  }
}

class DataList {
  final String orgID;
  final String colGrpCodeSys;
  final String colCodeSys;
  final String networkID;
  final String colOperatorType;
  final int orderIdx;
  final String? jsonRenderParams;
  final String? jsonListOption;
  final String flagIsNotNull;
  final String flagIsCheckDuplicate;
  final String flagIsQuery;
  final String flagActive;
  final String logLUDTimeUTC;
  final String logLUBy;
  final String colCode;
  final String colCaption;
  final String colDataType;
  final String flagIsColDynamic;
  final String sqlOperatorType;
  final String? mdmcJsonListOption;
  final String? lstMDOptionValue;

  DataList({
    required this.orgID,
    required this.colGrpCodeSys,
    required this.colCodeSys,
    required this.networkID,
    required this.colOperatorType,
    required this.orderIdx,
    this.jsonRenderParams,
    this.jsonListOption,
    required this.flagIsNotNull,
    required this.flagIsCheckDuplicate,
    required this.flagIsQuery,
    required this.flagActive,
    required this.logLUDTimeUTC,
    required this.logLUBy,
    required this.colCode,
    required this.colCaption,
    required this.colDataType,
    required this.flagIsColDynamic,
    required this.sqlOperatorType,
    this.mdmcJsonListOption,
    this.lstMDOptionValue,
  });

  factory DataList.fromMap(Map<String, dynamic> json) {
    return DataList(
      orgID: json['OrgID'] as String? ?? '',
      colGrpCodeSys: json['ColGrpCodeSys'] as String? ?? '',
      colCodeSys: json['ColCodeSys'] as String? ?? '',
      networkID: json['NetworkID'] as String? ?? '',
      colOperatorType: json['ColOperatorType'] as String? ?? '',
      orderIdx: json['OrderIdx'] as int? ?? 0,
      jsonRenderParams: json['JsonRenderParams'] as String?,
      jsonListOption: json['JsonListOption'] as String?,
      flagIsNotNull: json['FlagIsNotNull'] as String? ?? '',
      flagIsCheckDuplicate: json['FlagIsCheckDuplicate'] as String? ?? '',
      flagIsQuery: json['FlagIsQuery'] as String? ?? '',
      flagActive: json['FlagActive'] as String? ?? '',
      logLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      logLUBy: json['LogLUBy'] as String? ?? '',
      colCode: json['ColCode'] as String? ?? '',
      colCaption: json['ColCaption'] as String? ?? '',
      colDataType: json['ColDataType'] as String? ?? '',
      flagIsColDynamic: json['FlagIsColDynamic'] as String? ?? '',
      sqlOperatorType: json['SqlOperatorType'] as String? ?? '',
      mdmcJsonListOption: json['mdmc_JsonListOption'] as String?,
      lstMDOptionValue: json['Lst_MD_OptionValue'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': orgID,
      'ColGrpCodeSys': colGrpCodeSys,
      'ColCodeSys': colCodeSys,
      'NetworkID': networkID,
      'ColOperatorType': colOperatorType,
      'OrderIdx': orderIdx,
      'JsonRenderParams': jsonRenderParams,
      'JsonListOption': jsonListOption,
      'FlagIsNotNull': flagIsNotNull,
      'FlagIsCheckDuplicate': flagIsCheckDuplicate,
      'FlagIsQuery': flagIsQuery,
      'FlagActive': flagActive,
      'LogLUDTimeUTC': logLUDTimeUTC,
      'LogLUBy': logLUBy,
      'ColCode': colCode,
      'ColCaption': colCaption,
      'ColDataType': colDataType,
      'FlagIsColDynamic': flagIsColDynamic,
      'SqlOperatorType': sqlOperatorType,
      'mdmc_JsonListOption': mdmcJsonListOption,
      'Lst_MD_OptionValue': lstMDOptionValue,
    };
  }
}

