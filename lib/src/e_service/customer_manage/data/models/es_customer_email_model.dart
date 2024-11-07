import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer_email.dart';

class ESCustomerEmailModel extends ESCustomerEmail {
  const ESCustomerEmailModel({required super.CtmEmail});

  factory ESCustomerEmailModel.fromJson(Map<String, dynamic> json) {
    return ESCustomerEmailModel(
      CtmEmail: json['CtmEmail'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CtmEmail': CtmEmail,
    };
  }
}