import 'dart:convert';
import 'dart:io' as io;
import 'package:ecore/core/configs/app_config.dart';
import 'package:ecore/core/data/datasource/ccsv_datasource.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../errors/exceptions.dart';
import '../models/locale_item_model.dart';

abstract class LocalizationDataSrc {
  Future<DataMap> getRemoteData();

  DataMap? getLocalData();

  Future<void> addRemoteData(List<AddLocaleItemModel> list);
  Future<void> saveLocalData(DataMap data);
}

class LocalizationDataSrcImpl extends CcsvDataSrc
    implements LocalizationDataSrc {
  const LocalizationDataSrcImpl(super.client, this._pref);

  final SharedPreferences _pref;

  static const kLocalizationCacheKey = 'localization_cache_key';

  @override
  Future<DataMap> getRemoteData() async {
    final response = await post(
        path: 'api/localization/GetData',
        params: {'solutionCode': AppConfig.current().ccsvSolutionCode});

    var map = response as DataMap ?? {};
    map.keys.forEach((key) {
      var list = (map[key] as List)
          .map<LocaleItemModel>((e) => LocaleItemModel.fromMap(e))
          .toList();
      map[key] = list;
    });
    return map;
  }

  @override
  DataMap? getLocalData() {
    try {
      var strResult = _pref.getString(kLocalizationCacheKey);

      if (strResult != null && strResult.isNotEmpty) {
        var map = jsonDecode(strResult);

        map.keys.forEach((key) {
          var list = (map[key] as List)
              .map<LocaleItemModel>((e) => LocaleItemModel.fromJson(e))
              .toList();
          map[key] = list;
        });
        return map;
      }

      return null;
    } catch (e) {
      throw CacheException(Message: e.toString(), Code: '');
    }
  }

  @override
  Future<void> saveLocalData(DataMap data) async {
    try {
      if (data != null) {
        var json = jsonEncode(data);
        await _pref.setString(kLocalizationCacheKey, json);
      } else
        await _pref.remove(kLocalizationCacheKey);
    } catch (e) {
      throw CacheException(Message: e.toString(), Code: '');
    }
  }

  @override
  Future<void> addRemoteData(List<AddLocaleItemModel> list) async {
    var strList = (list.map((e) => e.toMap()).toList());

    final response = await post(
        path: 'api/localization/AddData',
        params: {
          'solutionCode': AppConfig.current().ccsvSolutionCode,
          'values': strList
        }
    );

    return response;
  }
}
