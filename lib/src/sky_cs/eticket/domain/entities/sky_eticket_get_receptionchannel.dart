import 'package:equatable/equatable.dart';

class SKY_ETicket_ReceptionChannel extends Equatable {
  SKY_ETicket_ReceptionChannel({
    required this.OrgID,
    required this.ReceptionChannel,
    required this.NetworkID,
    required this.AgentReceptionChannelName,
    required this.CustomerReceptionChannelName,
    required this.FlagUseType,
    required this.FlagActive,
    required this.Remark,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  final String OrgID;
  final String ReceptionChannel;
  final String NetworkID;
  final String AgentReceptionChannelName;
  final String CustomerReceptionChannelName;
  final String FlagUseType;
  final String Remark;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [
    OrgID,
    ReceptionChannel,
    NetworkID,
    AgentReceptionChannelName,
    CustomerReceptionChannelName,
    FlagUseType,
    Remark,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}
