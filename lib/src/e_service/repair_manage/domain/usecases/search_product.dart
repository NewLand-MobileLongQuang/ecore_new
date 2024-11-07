import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_product.dart';
import 'package:ecore/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class SearchProductParams extends Equatable {
  const SearchProductParams({required this.ProductCodeUser, required this.Ft_PageIndex, required this.Ft_PageSize});

  final String ProductCodeUser;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  @override
  List<Object?> get props => [];
}

class SearchProductUseCase extends UsecaseWithParams<List<ES_ROProduct>, SearchProductParams> {
  SearchProductUseCase(this._repository);
  final ES_RORepository _repository;

  @override
  ResultFuture<List<ES_ROProduct>> call(SearchProductParams params) async {
    return await _repository.searchProduct(params: params);
  }
}