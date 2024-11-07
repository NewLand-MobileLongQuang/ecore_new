import 'package:equatable/equatable.dart';

import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/locale_item.dart';
import '../repos/localization_repo.dart';




class GetLocaleRemoteData extends UsecaseWithoutParams<DataMap>
{
  const GetLocaleRemoteData(this._repo);
  final LocalizationRepo _repo;


  
  @override
  ResultFuture<DataMap> call() async => _repo.getRemoteData();
}