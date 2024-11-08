import 'package:ecore/core/modules/auth/domain/usecases/save_session_info.dart';
import 'package:ecore/src/call/domain/entities/calling_info.dart';
import 'package:equatable/equatable.dart';

import '../../../../services/injection/injection_container.dart';
import '../../../../utils/typedef.dart';
import '../usecases/load_session_info.dart';
import 'auth_result.dart';
import 'inos_user.dart';
import 'org.dart';

class SessionInfo extends Equatable {
  const SessionInfo(
      {required this.user,
      required this.auth,
      this.org,
      this.callingInfo,
      this.cacheData});

  SessionInfo._empty()
      : auth =
            const AuthResult(AccessToken: '', RefreshToken: '', ExpiredIn: 0),
        user = const InosUser(
            Id: 0, Email: '', Name: '', Phone: '', Language: '', Avatar: ''),
        org = null,
        cacheData = null,
        callingInfo = null;

  final InosUser user;
  final AuthResult auth;
  final Org? org;

  final CallingInfo? callingInfo;

  final DataMap? cacheData;

  bool isAuthenticated() {
    return auth.AccessToken.isNotEmpty;
  }

  String? getCache(String key) {
    return cacheData?[key];
  }

  SessionInfo copyWith({
    InosUser? user,
    AuthResult? auth,
    Org? org,
    DataMap? cacheData,
    CallingInfo? callingInfo,
  }) {
    return SessionInfo(
      user: user ?? this.user,
      auth: auth ?? this.auth,
      org: org ?? this.org,
      cacheData: cacheData ?? this.cacheData,
      callingInfo: callingInfo ?? this.callingInfo,
    );
  }

  @override
  List<Object?> get props => [user, auth];

  static SessionInfo _instance = SessionInfo._empty();

  static void reset() {
    _instance = SessionInfo._empty();
  }

  static SessionInfo current() {
    if (!_instance.isAuthenticated()) {
      final cResult = sl<LoadSessionInfo>()();

      cResult.fold((l) {}, (r) {
        if (r != null) {
          _instance = r as SessionInfo;
        }
      });
    }

    return _instance;
  }

  static void setCacheData(String key, String? value) {
    var ss = current();
    var map = ss.cacheData ?? new DataMap();
    if (value != null)
      map[key] = value;
    else
      map.removeWhere((key, value) => key == key);

    var newS = ss.copyWith(cacheData: map);

    sl<SaveSessionInfo>()(newS);

    _instance = newS;
  }
}
