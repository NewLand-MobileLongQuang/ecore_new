
import '../../domain/entities/sky_eticket_get_follower.dart';

class LstETTicketFollower extends SKY_TicketFollower {
  LstETTicketFollower({
    required super.TicketID,
    required super.OrgID,
    required super.AgentCode,
    required super.NetworkID,
    required super.FollowType,
    required super.LogLUDTimeUTC,
    required super.LogLUBy,
    required super.AgentName,
  });

  factory LstETTicketFollower.fromJson(Map<String, dynamic> json) {
    return LstETTicketFollower(
      TicketID: json['TicketID'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      AgentCode: json['AgentCode'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      FollowType: json['FollowType'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
      AgentName: json['AgentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TicketID': TicketID,
      'OrgID': OrgID,
      'AgentCode': AgentCode,
      'NetworkID': NetworkID,
      'FollowType': FollowType,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
      'AgentName': AgentName,
    };
  }
}
