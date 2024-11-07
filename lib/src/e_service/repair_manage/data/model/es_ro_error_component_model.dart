

import '../../domain/entities/es_ro_error_component.dart';

class ES_ROErrorComponentModel extends ES_ROErrorComponent {
  ES_ROErrorComponentModel({required super.OrgID, required super.ProductGrpCode, required super.ProductGrpName, required super.ComponentCode, required super.NetworkID, required super.ComponentName, required super.QtyComponent, required super.FlagActive, required super.DTimeUsed, required super.LogLUDTimeUTC, required super.LogLUBy});

  factory ES_ROErrorComponentModel.fromJson(Map<String, dynamic> json) {
    return ES_ROErrorComponentModel (
      OrgID: json['OrgID'] as String? ?? '',
      ProductGrpCode: json['ProductGrpCode'] as String? ?? '',
      ProductGrpName: json['ProductGrpName'] as String? ?? '',
      ComponentCode: json['ComponentCode'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      ComponentName: json['ComponentName'] as String? ?? '',
      QtyComponent: json['QtyComponent'] as double? ?? 0.0,
      FlagActive: json['FlagActive'] as String? ?? '',
      DTimeUsed: json['DTimeUsed'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': OrgID,
      'ProductGrpCode': ProductGrpCode,
      'ProductGrpName': ProductGrpName,
      'ComponentCode': ComponentCode,
      'NetworkID': NetworkID,
      'ComponentName': ComponentName,
      'QtyComponent': QtyComponent,
      'FlagActive': FlagActive,
      'DTimeUsed': DTimeUsed,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
    };
  }
}