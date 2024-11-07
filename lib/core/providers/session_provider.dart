
import 'package:flutter/cupertino.dart';

import '../modules/auth/domain/entities/inos_user.dart';
import '../modules/auth/domain/entities/session_info.dart';

class SessionProvider extends ChangeNotifier {
  SessionInfo? _session;

  InosUser? get user => _session?.user;

  SessionInfo? get session => _session;

  void initSession(SessionInfo? session) {
    if (_session != session) _session = session;
  }

  set session(SessionInfo? session) {
    if (_session != session) {
      _session=session;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
