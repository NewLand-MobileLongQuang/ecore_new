import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_group.dart';

class SKY_CustomerGroupModel extends SKY_CustomerGroup {
  SKY_CustomerGroupModel({required super.OrgID, required super.ColGrpCodeSys, required super.NetworkID, required super.ScrTplCodeSys, required super.ColGrpCode, required super.ColGrpName, required super.OrderIdx, required super.FlagActive, required super.LogLUDTimeUTC, required super.LogLUBy});

  factory SKY_CustomerGroupModel.fromMap(Map<String, dynamic> json) {
    return SKY_CustomerGroupModel(
      OrgID: json['OrgID'] as String? ?? '',
      ColGrpCodeSys: json['ColGrpCodeSys'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      ScrTplCodeSys: json['ScrTplCodeSys'] as String? ?? '',
      ColGrpCode: json['ColGrpCode'] as String? ?? '',
      ColGrpName: json['ColGrpName'] as String? ?? '',
      OrderIdx: json['OrderIdx'] as int? ?? 0,
      FlagActive: json['FlagActive'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrgID': OrgID,
      'ColGrpCodeSys': ColGrpCodeSys,
      'NetworkID': NetworkID,
      'ScrTplCodeSys': ScrTplCodeSys,
      'ColGrpCode': ColGrpCode,
      'ColGrpName': ColGrpName,
      'OrderIdx': OrderIdx,
      'FlagActive': FlagActive,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}