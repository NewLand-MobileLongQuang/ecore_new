import 'package:equatable/equatable.dart';

class RQ_SKY_eTicket_follower extends Equatable {
  RQ_SKY_eTicket_follower({
    required this.AgentCode,
    required this.FollowType,
  });

  final String AgentCode;
  final String FollowType;


  @override
  List<Object?> get props => [
    AgentCode,
    FollowType
  ];
}