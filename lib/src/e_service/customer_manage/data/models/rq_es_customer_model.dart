import 'package:ecore/src/e_service/customer_manage/domain/entities/rq_es_customer.dart';

class RQ_ES_CustomerModel extends RQ_ES_Customer {
  RQ_ES_CustomerModel({required super.CustomerCode, required super.CustomerName, required super.CustomerPhoneNo, required super.CustomerEmail, required super.CustomerAddress});

  factory RQ_ES_CustomerModel.fromMap(Map<String, dynamic> json) {
    return RQ_ES_CustomerModel(
      CustomerCode: json['CustomerCode'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      CustomerAddress: json['CustomerAddress'] as String? ?? '',
      CustomerPhoneNo: json['CustomerPhoneNo'] as String? ?? '',
      CustomerEmail: json['CustomerEmail'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CustomerCode': CustomerCode,
      'CustomerName': CustomerName,
      'CustomerAddress': CustomerAddress,
      'CustomerPhoneNo': CustomerPhoneNo,
      'CustomerEmail': CustomerEmail,
    };
  }
}