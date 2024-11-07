import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../core/utils/typedef.dart';

class ExtConnectInfo {
  ExtConnectInfo({this.Server, this.Protocol, this.ExtDomain, this.Token});

  final String? Server;
  final String? Protocol;
  final String? ExtDomain;
  final String? Token;

  ExtConnectInfo.fromMap(DataMap map)
      : this(
          Server: map['Server'] as String?,
          Protocol: map['Protocol'] as String?,
          ExtDomain: map['ExtDomain'] as String?,
          Token: map['Token'] as String?,
        );

  factory ExtConnectInfo.fromJson(String source) =>
      ExtConnectInfo.fromMap(jsonDecode(source) as DataMap);
}

class CallingInfo extends Equatable {
  const CallingInfo(
      {required this.ExtId,
      required this.OrgId,
      required this.Alias,
      required this.AgentStatus,
      required this.OnlineStatus,
      required this.Token,
      required this.UseIpPhone,
      required this.CalloutNumber,
      required this.CalloutNumbers});

  final String? ExtId;

  final String? OrgId;

  final String? Alias;

  final String? AgentStatus;

  final String? OnlineStatus;

  final String? Token;

  final bool UseIpPhone;

  final String? CalloutNumber;

  final List<String>? CalloutNumbers;

  ExtConnectInfo? getExtConnectInfo() {
    if (this.Token == null || this.Token!.isEmpty) return null;

    var encoded = '';
    for (var i = 0; i < this.Token!.length; ++i) {
      encoded += String.fromCharCode(this.Token!.codeUnitAt(i) - 1);
    }

    String decoded = utf8.decode(base64Url.decode(encoded));

    return ExtConnectInfo.fromJson(decoded);
  }

  @override
  List<Object?> get props => [
        ExtId,

        OrgId,

        Alias,

        AgentStatus,

        OnlineStatus,

        Token,

        UseIpPhone,

        CalloutNumber,

        //CalloutNumbers
      ];
}
