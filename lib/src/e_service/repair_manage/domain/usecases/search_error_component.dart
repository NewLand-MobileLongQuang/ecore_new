import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/rt_es_ro_error_component.dart';
import 'package:ecore/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class SearchErrorComponentParams extends Equatable {
  const SearchErrorComponentParams({required this.ProductGrpCode, required this.OrgID});

  final String ProductGrpCode;
  final String OrgID;

  @override
  List<Object?> get props => [];
}

class SearchErrorComponentUseCase extends UsecaseWithParams<RT_ES_ROErrorComponent, SearchErrorComponentParams> {
  SearchErrorComponentUseCase(this._repository);
  final ES_RORepository _repository;

  @override
  ResultFuture<RT_ES_ROErrorComponent> call(SearchErrorComponentParams params) async {
    return await _repository.searchErrorComponent(params: params);
  }
}