import '../../domain/entities/rq_sky_eticket_follower.dart';

class RQ_SKY_eTicket_follower_Model extends RQ_SKY_eTicket_follower {
  RQ_SKY_eTicket_follower_Model({
    required super.AgentCode,
    required super.FollowType,

  });

  factory RQ_SKY_eTicket_follower_Model.fromJson(Map<String, dynamic> json) {
    return RQ_SKY_eTicket_follower_Model(
      AgentCode: json['AgentCode'] as String? ?? '',
      FollowType: json['FollowType'] as String? ?? '',

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'AgentCode': AgentCode,
      'FollowType': FollowType,

    };
  }
}