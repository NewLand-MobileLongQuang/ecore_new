import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_type.dart';

class SKY_CustomerTypeModel extends SKY_CustomerType {
  SKY_CustomerTypeModel({required super.CustomerType, required super.CustomerTypeName});

  factory SKY_CustomerTypeModel.fromJson(Map<String, dynamic> json) {
    return SKY_CustomerTypeModel(
      CustomerType: json['CustomerType'] as String? ?? '',
      CustomerTypeName: json['CustomerTypeName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CustomerType': CustomerType,
      'CustomerTypeName': CustomerTypeName,
    };
  }
}