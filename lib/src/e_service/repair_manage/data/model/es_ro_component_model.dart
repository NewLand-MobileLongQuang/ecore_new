

import '../../domain/entities/es_ro_component.dart';

class ES_ROComponentModel extends ES_ROComponent {
  ES_ROComponentModel({required super.ProductGrpCode, required super.ComponentCode,});

  factory ES_ROComponentModel.fromJson(Map<String, dynamic> json) {
    return ES_ROComponentModel(
      ProductGrpCode: json['ProductGrpCode'] as String? ?? '',
      ComponentCode: json['ComponentCode'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductGrpCode': ProductGrpCode,
      'ComponentCode': ComponentCode,
    };
  }
}