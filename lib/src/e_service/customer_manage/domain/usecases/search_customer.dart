import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/repos/es_customer_repo.dart';

class SearchCustomerParams extends Equatable {
  SearchCustomerParams({
    required this.KeyWord,
    required this.Ft_PageIndex,
    required this.Ft_PageSize,
  });

  final String KeyWord;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  @override
  List<Object?> get props => [
    KeyWord,
    Ft_PageIndex,
    Ft_PageSize,
  ];
}

class SearchCustomerUseCase extends UsecaseWithParams<List<ES_Customer>, SearchCustomerParams> {
  SearchCustomerUseCase(this._repository);
  final ES_CustomerRepository _repository;

  @override
  ResultFuture<List<ES_Customer>> call(SearchCustomerParams params) async {
    return await _repository.search(params: params);
  }
}