import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_user_manager.dart';

class RQ_SKY_UserManagerModel extends RQ_SKY_UserManager {
  RQ_SKY_UserManagerModel({required super.OrgID, required super.UserCodeMng});

  factory RQ_SKY_UserManagerModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_UserManagerModel(
      OrgID: json['OrgID'] as String? ?? '',
      UserCodeMng: json['UserCodeMng'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': OrgID,
      'UserCodeMng': UserCodeMng,
    };
  }
}