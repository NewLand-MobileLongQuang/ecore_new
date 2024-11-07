import 'dart:convert';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/calling_info.dart';

class CallingInfoModel extends CallingInfo {
  const CallingInfoModel(
      {required super.ExtId,
      required super.OrgId,
      required super.Alias,
      required super.AgentStatus,
      required super.OnlineStatus,
      required super.Token,
      required super.UseIpPhone,
      required super.CalloutNumber,
      required super.CalloutNumbers});

  CallingInfoModel.fromBase(CallingInfo base)
      : this(
          AgentStatus: base.AgentStatus,
          Token: base.Token,
          ExtId: base.ExtId,
          Alias: base.Alias,
          CalloutNumbers: base.CalloutNumbers,
          OnlineStatus: base.OnlineStatus,
          OrgId: base.OrgId,
          UseIpPhone: base.UseIpPhone,
          CalloutNumber: base.CalloutNumber,
        );

  CallingInfoModel.fromMap(DataMap map)
      : this(
          ExtId: map['ExtId'] as String?,
          OrgId: map['OrgId'] as String?,
          Alias: map['Alias'] as String?,
          AgentStatus: map['AgentStatus'] as String?,
          OnlineStatus: map['OnlineStatus'] as String?,
          Token: map['Token'] as String?,
          UseIpPhone: map['UseIpPhone'] as bool,
          CalloutNumber: map['CalloutNumber'] as String?,
          CalloutNumbers: map.containsKey('CalloutNumbers')
              ? map['CalloutNumbers'].cast<String>() as List<String>?
              : null,
        );

  DataMap toMap() => {
        'ExtId': ExtId,
        'OrgId': OrgId,
        'Alias': Alias,
        'AgentStatus': AgentStatus,
        'OnlineStatus': OnlineStatus,
        'Token': Token,
        'UseIpPhone': UseIpPhone,
        'CalloutNumber': CalloutNumber,
        'CalloutNumbers': CalloutNumbers,
      };

  factory CallingInfoModel.fromJson(String source) =>
      CallingInfoModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  CallingInfoModel copyWith({
    String? ExtId,
    String? OrgId,
    String? Alias,
    String? AgentStatus,
    String? OnlineStatus,
    String? Token,
    bool? UseIpPhone,
    String? CalloutNumber,
    List<String>? CalloutNumbers,
  }) {
    return CallingInfoModel(
      ExtId: ExtId ?? this.ExtId,
      OrgId: OrgId ?? this.OrgId,
      Alias: Alias ?? this.Alias,
      AgentStatus: AgentStatus ?? this.AgentStatus,
      OnlineStatus: OnlineStatus ?? this.OnlineStatus,
      Token: Token ?? this.Token,
      UseIpPhone: UseIpPhone ?? this.UseIpPhone,
      CalloutNumber: CalloutNumber ?? this.CalloutNumber,
      CalloutNumbers: CalloutNumbers ?? this.CalloutNumbers,
    );
  }
}
