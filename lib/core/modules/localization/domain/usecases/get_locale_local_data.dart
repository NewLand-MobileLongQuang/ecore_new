import 'package:equatable/equatable.dart';

import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/locale_item.dart';
import '../repos/localization_repo.dart';




class GetLocaleLocalData extends UsecaseWithoutParamsSync<DataMap?>
{
  const GetLocaleLocalData(this._repo);
  final LocalizationRepo _repo;

  @override
  ResultSync<DataMap?> call()  => _repo.getLocalData();
}