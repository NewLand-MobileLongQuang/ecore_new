import 'package:ecore/src/e_service/customer_manage/data/models/es_customer_detail_model.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/es_customer_email_model.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/es_customer_phone_model.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_customer_detail.dart';

class RT_ESCustomerDetailModel extends RT_ESCustomerDetail {
  const RT_ESCustomerDetailModel({required super.Lst_Mst_Customer, required super.Lst_Mst_CustomerEmail, required super.Lst_Mst_CustomerPhone});

  factory RT_ESCustomerDetailModel.fromMap(Map<String, dynamic> json) {
    return RT_ESCustomerDetailModel(
      Lst_Mst_Customer: json['Lst_Mst_Customer'] != null
          ? (json['Lst_Mst_Customer'] as List).map((item) => ESCustomerDetailModel.fromMap(item as Map<String, dynamic>)).toList()
          : <ESCustomerDetailModel>[],
      Lst_Mst_CustomerEmail: json['Lst_Mst_CustomerEmail'] != null
          ? (json['Lst_Mst_CustomerEmail'] as List).map((item) => ESCustomerEmailModel.fromMap(item as Map<String, dynamic>)).toList()
          : <ESCustomerEmailModel>[],
      Lst_Mst_CustomerPhone: json['Lst_Mst_CustomerPhone'] != null
          ? (json['Lst_Mst_CustomerPhone'] as List).map((item) => ESCustomerPhoneModel.fromMap(item as Map<String, dynamic>)).toList()
          : <ESCustomerPhoneModel>[],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_Customer': Lst_Mst_Customer,
      'Lst_Mst_CustomerEmail': Lst_Mst_CustomerEmail,
      'Lst_Mst_CustomerPhone': Lst_Mst_CustomerPhone,
    };
  }
}
