

import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_info_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_phone_model.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';

class SKY_CustomerDetailModel extends SKY_CustomerDetail {
  SKY_CustomerDetailModel({required super.Lst_Mst_Customer, required super.Lst_Mst_CustomerPhone});

  factory SKY_CustomerDetailModel.fromMap(Map<String, dynamic> json) {
    return SKY_CustomerDetailModel(
      Lst_Mst_Customer: json['Lst_Mst_Customer'] != null
          ? (json['Lst_Mst_Customer'] as List).map((item) => SKY_CustomerInfoModel.fromMap(item as Map<String, dynamic>)).toList()
          : <SKY_CustomerInfoModel>[],
      Lst_Mst_CustomerPhone: json['Lst_Mst_CustomerPhone'] != null
          ? (json['Lst_Mst_CustomerPhone'] as List).map((item) => SKY_CustomerPhoneModel.fromMap(item as Map<String, dynamic>)).toList()
          : <SKY_CustomerPhoneModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Lst_Mst_Customer': Lst_Mst_Customer,
      'Lst_Mst_CustomerPhone': Lst_Mst_CustomerPhone,
    };
  }
}