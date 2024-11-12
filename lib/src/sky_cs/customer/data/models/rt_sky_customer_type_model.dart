

import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_type_model.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rt_sky_customer_type.dart';

class RT_SKY_CustomerTypeModel extends RT_SKY_CustomerType {
  RT_SKY_CustomerTypeModel({required super.Lst_Mst_CustomerType});

  factory RT_SKY_CustomerTypeModel.fromMap(Map<String, dynamic> json) {
    return RT_SKY_CustomerTypeModel(
      Lst_Mst_CustomerType: json['Lst_Mst_CustomerType'] != null
          ? (json['Lst_Mst_CustomerType'] as List).map((item) => SKY_CustomerTypeModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_CustomerTypeModel>[],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_CustomerType': Lst_Mst_CustomerType,
    };
  }
}