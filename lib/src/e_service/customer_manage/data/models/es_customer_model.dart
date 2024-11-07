

import '../../domain/entities/es_customer.dart';

class ES_CustomerModel extends ES_Customer {
  ES_CustomerModel({ required super.CustomerCodeSys, required super.CustomerCode, required super.CustomerName, required super.CustomerPhoneNo, required super.CustomerEmail, required super.CustomerAddress, required super.CustomerAvatarPath});

  factory ES_CustomerModel.fromMap(Map<String, dynamic> map) {
    return ES_CustomerModel(
      CustomerCodeSys: map['CustomerCodeSys'] as String? ?? '',
      CustomerCode: map['CustomerCode'] as String? ?? '',
      CustomerName: map['CustomerName'] as String? ?? '',
      CustomerPhoneNo: map['CustomerPhoneNo'] as String? ?? '',
      CustomerEmail: map['CustomerEmail'] as String? ?? '',
      CustomerAddress: map['CustomerAddress'] as String? ?? '',
      CustomerAvatarPath: map['CustomerAvatarPath'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'CustomerCodeSys': CustomerCodeSys,
      'CustomerCode': CustomerCode,
      'CustomerName': CustomerName,
      'CustomerPhoneNo': CustomerPhoneNo,
      'CustomerEmail': CustomerEmail,
      'CustomerAddress': CustomerAddress,
      'CustomerAvatarPath': CustomerAvatarPath,
    };
  }
}