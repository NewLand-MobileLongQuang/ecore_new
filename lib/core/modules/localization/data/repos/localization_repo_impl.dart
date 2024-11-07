import 'package:dartz/dartz.dart';
import 'package:ecore/core/modules/localization/data/models/locale_item_model.dart';

import '../../../../errors/exceptions.dart';
import '../../../../errors/failure.dart';
import '../../../../utils/typedef.dart';
import '../../domain/entities/locale_item.dart';
import '../../domain/repos/localization_repo.dart';

import '../datasource/localization_data_source.dart';

class LocalizationRepoImpl implements LocalizationRepo {
  const LocalizationRepoImpl(this._datasource);

  final LocalizationDataSrc _datasource;

  @override
  ResultFuture<DataMap> getRemoteData() async {
    try {
      final result = await _datasource.getRemoteData();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid addRemoteData(List<AddLocaleItemModel> list) async {
    try {
      await _datasource.addRemoteData(list);

      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }

  @override
  ResultSync<DataMap?> getLocalData() {
    try {
      final result =  _datasource.getLocalData();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid saveLocalData(DataMap data) async{
    try {
      await _datasource.saveLocalData(data);

      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }
}
