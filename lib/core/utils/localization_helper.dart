import 'package:ecore/core/utils/typedef.dart';

import '../modules/localization/data/models/locale_item_model.dart';
import '../modules/localization/domain/usecases/add_locale_remotedata.dart';
import '../modules/localization/domain/usecases/get_locale_local_data.dart';
import '../modules/localization/domain/usecases/get_locale_remote_data.dart';
import '../modules/localization/domain/usecases/save_locale_localdata.dart';
import '../services/injection/injection_container.dart';

class LocalizationHelper {
  final String cate;

  final GetLocaleRemoteData _getLocaleRemoteData = sl<GetLocaleRemoteData>();
  final GetLocaleLocalData _getLocaleLocalData = sl<GetLocaleLocalData>();
  final SaveLocaleLocalData _saveLocaleLocalData = sl<SaveLocaleLocalData>();
  final AddLocaleRemoteData _addLocaleRemoteData = sl<AddLocaleRemoteData>();

  late DataMap? _data;
  late List<LocaleItemModel>? _dataList;


  LocalizationHelper(this.cate) {

    final _cate= this.cate.toUpperCase();
    final dataResult = _getLocaleLocalData();

    _data=null;
    _dataList=null;
    dataResult.fold((l) => null, (r) {
      _data = r!;

      if (_data![_cate] != null) _dataList = (_data![_cate] as List).map<LocaleItemModel>((e) => e as LocaleItemModel).toList();
    });
    if (_data == null) _data = {};




  }


  String call(String key) {

    final _cate= this.cate.toUpperCase();
    if (_dataList == null) {
      _dataList = [];
      _data![_cate] = _dataList;
    }

    var item = _dataList?.where((element) => element.key == key).firstOrNull;

    if (item != null) return item.value;

    _dataList?.add(LocaleItemModel(key: key, value: key));

    _data![_cate]=_dataList;
    _saveLocaleLocalData(_data!);

    return key;
  }
}
