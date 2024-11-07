import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_error_type.dart';
import 'package:ecore/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class SearchErrorTypeParams extends Equatable {
  const SearchErrorTypeParams();

  @override
  List<Object?> get props => [];
}

class SearchErrorTypeUseCase extends UsecaseWithParams<List<ES_ROErrorType>, SearchErrorTypeParams> {
  SearchErrorTypeUseCase(this._repository);
  final ES_RORepository _repository;

  @override
  ResultFuture<List<ES_ROErrorType>> call(SearchErrorTypeParams params) async {
    return _repository.searchErrorType(params: params);
  }
}