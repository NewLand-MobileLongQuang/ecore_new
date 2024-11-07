import 'dart:convert';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/agent.dart';

class AgentModel extends Agent {
  const AgentModel(
      {required super.AgentId,
      required super.Name,
      required super.UserId,
      required super.OrgId,
      required super.AgentStatus,
      required super.Alias,
      required super.AllowCallout,
      required super.DeviceState,
      required super.Email,
      required super.ExtId,
      required super.Extension,
      required super.IsActive,
      required super.LastCallDTime,
      required super.OnlineStatus,
      required super.PhoneNumber,
      required super.UseIphone});

  AgentModel.fromMap(DataMap map)
      : this(
          AgentId: map['AgentId'] as int,
          Name: map['Name'] as String?,
          UserId: map['UserId'] as int,
          OrgId: map['OrgId'] as int,
          AgentStatus: map['AgentStatus'] as String?,
          Alias: map['Alias'] as String?,
          AllowCallout: map['AllowCallout'] as bool?,
          DeviceState: map['DeviceState'] as String?,
          Email: map['Email'] as String?,
          ExtId: map['ExtId'] as int?,
          Extension: map['Extension'] as String?,
          IsActive: map['IsActive'] as bool?,
          LastCallDTime: map['LastCallDTime'] as String?,
          OnlineStatus: map['OnlineStatus'] as String?,
          PhoneNumber: map['PhoneNumber'] as String?,
          UseIphone: map['UseIphone'] as bool?,
        );

  DataMap toMap() => {
        'AgentId': AgentId,
        'Name': Name,
        'UserId': UserId,
        'OrgId': OrgId,
        'AgentStatus': AgentStatus,
        'Alias': Alias,
        'AllowCallout': AllowCallout,
        'DeviceState': DeviceState,
        'Email': Email,
        'ExtId': ExtId,
        'Extension': Extension,
        'IsActive': IsActive,
        'LastCallDTime': LastCallDTime,
        'OnlineStatus': OnlineStatus,
        'PhoneNumber': PhoneNumber,
        'UseIphone': UseIphone,
      };

  factory AgentModel.fromJson(String source) =>
      AgentModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  AgentModel copyWith({
    int? AgentId,
    String? Name,
    int? UserId,
    int? OrgId,
    String? AgentStatus,
    String? Alias,
    bool? AllowCallout,
    String? DeviceState,
    String? Email,
    int? ExtId,
    String? Extension,
    bool? IsActive,
    String? LastCallDTime,
    String? OnlineStatus,
    String? PhoneNumber,
    bool? UseIphone,
  }) {
    return AgentModel(
      AgentId: AgentId ?? this.AgentId,
      Name: Name ?? this.Name,
      UserId: UserId ?? this.UserId,
      OrgId: OrgId ?? this.OrgId,
      AgentStatus: AgentStatus ?? this.AgentStatus,
      Alias: Alias ?? this.Alias,
      AllowCallout: AllowCallout ?? this.AllowCallout,
      DeviceState: DeviceState ?? this.DeviceState,
      Email: Email ?? this.Email,
      ExtId: ExtId ?? this.ExtId,
      Extension: Extension ?? this.Extension,
      IsActive: IsActive ?? this.IsActive,
      LastCallDTime: LastCallDTime ?? this.LastCallDTime,
      OnlineStatus: OnlineStatus ?? this.OnlineStatus,
      PhoneNumber: PhoneNumber ?? this.PhoneNumber,
      UseIphone: UseIphone ?? this.UseIphone,
    );
  }
}
