import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_hist.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';

class SearchCustomerHistParams extends Equatable {
  const SearchCustomerHistParams({required this.CustomerCodeSys, required this.Ft_PageIndex, required this.Ft_PageSize});

  final String CustomerCodeSys;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  @override
  List<Object?> get props => [CustomerCodeSys, Ft_PageIndex, Ft_PageSize];

  Map<String, dynamic> toMap() {
    return {
      'CustomerCodeSys': CustomerCodeSys,
      'Ft_PageIndex': Ft_PageIndex,
      'Ft_PageSize': Ft_PageSize,
    };
  }
}

class SearchCustomerHistUseCase extends UsecaseWithParams<List<SKY_CustomerHist>, SearchCustomerHistParams> {
  SearchCustomerHistUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<List<SKY_CustomerHist>> call(SearchCustomerHistParams params) async {
    return await _repository.searchCustomerHist(params: params);
  }
}