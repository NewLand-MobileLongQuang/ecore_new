import 'package:equatable/equatable.dart';

class LstETTicketFollowerHO extends Equatable {
  LstETTicketFollowerHO({
    required this.TicketID,
    required this.OrgID,
    required this.AgentCode,
    required this.NetworkID,
    required this.FollowType,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
    required this.AgentName,
  });

  final String TicketID;
  final String OrgID;
  final String AgentCode;
  final String NetworkID;
  final String FollowType;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String AgentName;

  @override
  List<Object> get props => [
    TicketID,
    OrgID,
    AgentCode,
    NetworkID,
    FollowType,
    LogLUDTimeUTC,
    LogLUBy,
    AgentName,
  ];
}
