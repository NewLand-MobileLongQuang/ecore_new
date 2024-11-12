import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_zalo_user.dart';

class SKY_CustomerZaloUserModel extends SKY_CustomerZaloUser {
  SKY_CustomerZaloUserModel({required super.user_id, required super.user_name, required super.user_gender, required super.user_id_by_app, required super.avatar, required super.display_name});

  factory SKY_CustomerZaloUserModel.fromMap(Map<String, dynamic> json) {
    return SKY_CustomerZaloUserModel(
      user_id: json['user_id'] as String? ?? '',
      user_name: json['user_name'] as String? ?? '',
      user_gender: json['user_gender'] as String? ?? '',
      user_id_by_app: json['user_id_by_app'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      display_name: json['display_name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'user_name': user_name,
      'user_gender': user_gender,
      'user_id_by_app': user_id_by_app,
      'avatar': avatar,
      'display_name': display_name,
    };
  }
}