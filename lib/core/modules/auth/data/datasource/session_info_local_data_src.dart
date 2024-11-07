import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../errors/exceptions.dart';
import '../../domain/entities/session_info.dart';
import '../models/session_info_model.dart';



abstract class SessionInfoLocalDataSrc {
  const SessionInfoLocalDataSrc();

  Future<void> saveSessionInfo(SessionInfo? info);

  SessionInfoModel? loadSessionInfo();
}

const kSessionInfoCacheKey = 'session_info_cache_key';

class SessionInfoLocalDataSrcImpl implements SessionInfoLocalDataSrc {
  const SessionInfoLocalDataSrcImpl(this._pref);

  final SharedPreferences _pref;

  @override
  SessionInfoModel? loadSessionInfo() {
    try {
      final strResult = _pref.getString(kSessionInfoCacheKey);

      if (strResult != null && strResult.isNotEmpty) {
        return SessionInfoModel.fromJson(strResult);
      }

      return null;
    } catch (e) {
      throw CacheException(Message: e.toString(), Code: 'Code');
    }
  }

  @override
  Future<void> saveSessionInfo(SessionInfo? info) async {
    try {
      if (info != null) {
        var model= SessionInfoModel.fromBase(info!);
        var json = model.toJson();
        

        await _pref.setString(kSessionInfoCacheKey, json);
      }
      else await _pref.remove(kSessionInfoCacheKey);
    } catch (e) {
      throw CacheException(Message: e.toString(), Code: 'Code');
    }
  }
}
