import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_contact.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';

class SearchCustomerContactParams extends Equatable {
  SearchCustomerContactParams({required this.CustomerCodeSys, required this.FlagActive, required this.Ft_PageIndex, required this.Ft_PageSize, required this.OrderByClause});

  final String CustomerCodeSys;
  final String FlagActive;
  final String Ft_PageIndex;
  final String Ft_PageSize;
  final String OrderByClause;

  @override
  List<Object?> get props => [CustomerCodeSys, FlagActive, Ft_PageIndex, Ft_PageSize, OrderByClause];
}

class SearchCustomerContactUseCase extends UsecaseWithParams<List<SKY_CustomerContact>, SearchCustomerContactParams> {
  SearchCustomerContactUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<List<SKY_CustomerContact>> call(SearchCustomerContactParams params) async {
    return await _repository.searchCustomerContact(params: params);
  }
}