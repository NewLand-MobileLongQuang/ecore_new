import 'package:equatable/equatable.dart';

import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/locale_item.dart';
import '../repos/localization_repo.dart';




class SaveLocaleLocalData extends UsecaseWithParams<void, DataMap>
{
  const SaveLocaleLocalData(this._repo);
  final LocalizationRepo _repo;

  @override
  ResultFuture<void> call(DataMap params) async => _repo.saveLocalData(params);
}