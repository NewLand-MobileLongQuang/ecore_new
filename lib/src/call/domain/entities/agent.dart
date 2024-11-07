import 'package:equatable/equatable.dart';

class Agent extends Equatable {
  const Agent(
      {required this.AgentId,
      required this.Name,
      required this.UserId,
      required this.OrgId,
      required this.AgentStatus,
      required this.Alias,
      required this.AllowCallout,
      required this.DeviceState,
      required this.Email,
      required this.ExtId,
      required this.Extension,
      required this.IsActive,
      required this.LastCallDTime,
      required this.OnlineStatus,
      required this.PhoneNumber,
      required this.UseIphone});

  final int AgentId;

  final String? Name;

  final int UserId;

  final int OrgId;

  final String? AgentStatus;

  final String? Alias;

  final bool? AllowCallout;

  final String? DeviceState;

  final String? Email;

  final int? ExtId;

  final String? Extension;

  final bool? IsActive;

  final String? LastCallDTime;

  final String? OnlineStatus;

  final String? PhoneNumber;

  final bool? UseIphone;

  @override
  List<Object?> get props => [
        AgentId,
        Name,
        UserId,
        OrgId,
        AgentStatus,
        Alias,
        AllowCallout,
        DeviceState,
        Email,
        ExtId,
        Extension,
        IsActive,
        LastCallDTime,
        OnlineStatus,
        PhoneNumber,
        UseIphone
      ];
}
