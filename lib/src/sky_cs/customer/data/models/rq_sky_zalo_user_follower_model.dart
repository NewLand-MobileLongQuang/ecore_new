import 'package:ecore/src/sky_cs/customer/domain/entities/rq_sky_zalo_user_follower.dart';

class RQ_SKY_ZaloUserFollowerModel extends RQ_SKY_ZaloUserFollower {
  RQ_SKY_ZaloUserFollowerModel({required super.OrgID, required super.CustomerCodeSys, required super.ZaloUserFollowerId, required super.SolutionCode, required super.FlagDefault});

  factory RQ_SKY_ZaloUserFollowerModel.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_ZaloUserFollowerModel(
      OrgID: json['OrgID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      ZaloUserFollowerId: json['ZaloUserFollowerId'] as String? ?? '',
      SolutionCode: json['SolutionCode'] as String? ?? '',
      FlagDefault: json['FlagDefault'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': super.OrgID,
      'CustomerCodeSys': super.CustomerCodeSys,
      'ZaloUserFollowerId': super.ZaloUserFollowerId,
      'SolutionCode': super.SolutionCode,
      'FlagDefault': super.FlagDefault,
    };
  }
}