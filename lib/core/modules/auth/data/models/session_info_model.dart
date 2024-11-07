import 'dart:convert';

import 'package:ecore/src/call/data/models/calling_info_model.dart';
import 'package:ecore/src/call/domain/entities/calling_info.dart';

import '../../../../utils/typedef.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/entities/inos_user.dart';
import '../../domain/entities/org.dart';
import '../../domain/entities/session_info.dart';
import 'auth_result.dart';
import 'inos_user_model.dart';
import 'org_model.dart';

class SessionInfoModel extends SessionInfo {
  SessionInfoModel(
      {required super.user,
      required super.auth,
      super.cacheData,
      super.org,
      super.callingInfo});

  SessionInfoModel.fromBase(SessionInfo base)
      : this(
          user: base.user,
          auth: base.auth,
          org: base.org,
          callingInfo: base.callingInfo,
          cacheData: base.cacheData,
        );

  SessionInfoModel.fromMap(DataMap map)
      : this(
          user: UserModel.fromMap(map['user'] as DataMap),
          auth: AuthResultModel.fromMap(map['auth'] as DataMap),
          org: map.containsKey('org') && map['org'] != null
              ? OrgModel.fromMap(map['org'] as DataMap)
              : null,
          callingInfo:
              map.containsKey('callingInfo') && map['callingInfo'] != null
                  ? CallingInfoModel.fromMap(map['callingInfo'] as DataMap)
                  : null,
          cacheData: map.containsKey('cacheData') && map['cacheData'] != null
              ? map['cacheData'] as DataMap
              : null,
        );

  DataMap toMap() => org != null
      ? {
          'user': UserModel.fromBase(user).toMap(),
          'auth': AuthResultModel.fromBase(auth).toMap(),
          'org': OrgModel.fromBase(org!).toMap(),
          'callingInfo': callingInfo != null
              ? CallingInfoModel.fromBase(callingInfo!).toMap()
              : null,
          'cacheData': cacheData
        }
      : {
          'user': UserModel.fromBase(user).toMap(),
          'auth': AuthResultModel.fromBase(auth).toMap(),
          'callingInfo': callingInfo != null
              ? CallingInfoModel.fromBase(callingInfo!)
              : null,
          'cacheData': cacheData
        };

  factory SessionInfoModel.fromJson(String source) =>
      SessionInfoModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  SessionInfoModel copyWith({
    InosUser? user,
    AuthResult? auth,
    Org? org,
    DataMap? cacheData,
    CallingInfo? callingInfo,
  }) {
    return SessionInfoModel(
      user: user ?? this.user,
      auth: auth ?? this.auth,
      org: org ?? this.org,
      cacheData: cacheData?? this.cacheData,
      callingInfo: callingInfo ?? this.callingInfo,
    );
  }
}
