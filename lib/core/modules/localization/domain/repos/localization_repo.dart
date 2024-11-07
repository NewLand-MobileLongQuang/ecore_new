
import '../../../../utils/typedef.dart';
import '../../data/models/locale_item_model.dart';
import '../entities/locale_item.dart';

abstract class LocalizationRepo {
  const LocalizationRepo();

  

  ResultFuture<DataMap> getRemoteData();

  ResultSync<DataMap?> getLocalData();

  ResultVoid addRemoteData(List<AddLocaleItemModel> list);
  ResultVoid saveLocalData(DataMap data);

 
}
