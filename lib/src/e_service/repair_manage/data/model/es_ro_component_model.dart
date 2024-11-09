

import '../../domain/entities/es_ro_component.dart';

class ES_ROComponentModel extends ES_ROComponent {
  ES_ROComponentModel({required super.ProductGrpCode, required super.ComponentCode, required super.ComponentName});

  factory ES_ROComponentModel.fromMap(Map<String, dynamic> json) {
    return ES_ROComponentModel(
      ProductGrpCode: json['ProductGrpCode'] as String? ?? '',
      ComponentCode: json['ComponentCode'] as String? ?? '',
      ComponentName: json['ComponentName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ProductGrpCode': ProductGrpCode,
      'ComponentCode': ComponentCode,
      'ComponentName': ComponentName,
    };
  }
}