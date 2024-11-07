import 'package:ecore/core/modules/localization/data/models/locale_item_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/locale_item.dart';
import '../repos/localization_repo.dart';




class AddLocaleRemoteData extends UsecaseWithParams<void, List<AddLocaleItemModel>>
  {
  const AddLocaleRemoteData(this._repo);
  final LocalizationRepo _repo;

  @override
  ResultFuture<void> call(List<AddLocaleItemModel> params) async => _repo.addRemoteData(params);
}