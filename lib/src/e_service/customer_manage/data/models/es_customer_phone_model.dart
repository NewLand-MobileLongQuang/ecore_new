import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer_phone.dart';

class ESCustomerPhoneModel extends ESCustomerPhone {
  const ESCustomerPhoneModel({required super.CtmPhoneNo});

  factory ESCustomerPhoneModel.fromMap(Map<String, dynamic> json) {
    return ESCustomerPhoneModel(
      CtmPhoneNo: json['CtmPhoneNo'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'CtmPhoneNo': CtmPhoneNo,
    };
  }
}