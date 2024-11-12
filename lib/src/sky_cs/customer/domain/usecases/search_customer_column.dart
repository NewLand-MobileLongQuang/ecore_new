import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';

class SearchCustomerColumnParams extends Equatable {
  const SearchCustomerColumnParams({
    required this.ScrTplCodeSys,
    required this.FlagActive,
    required this.Ft_PageIndex,
    required this.Ft_PageSize,
    required this.OrderByClause,
  });

  final String ScrTplCodeSys;
  final String FlagActive;
  final String Ft_PageIndex;
  final String Ft_PageSize;
  final String OrderByClause;

  @override
  List<Object?> get props => [
    ScrTplCodeSys,
    FlagActive,
    Ft_PageIndex,
    Ft_PageSize,
    OrderByClause,
  ];
}

class SearchCustomerColumnUseCase extends UsecaseWithParams<List<SKY_CustomerColumn>, SearchCustomerColumnParams> {
  SearchCustomerColumnUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<List<SKY_CustomerColumn>> call(SearchCustomerColumnParams params) async {
    return await _repository.searchCustomerColumn(params: params);
  }
}