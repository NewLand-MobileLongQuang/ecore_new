import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/repos/es_customer_repo.dart';

class CreateCustomerParams extends Equatable{
  const CreateCustomerParams({required this.strJson});

  final String strJson;

  @override
  List<Object?> get props => [strJson];

}

class CreateCustomerUseCase extends UsecaseWithParams<ES_Customer, CreateCustomerParams> {
  CreateCustomerUseCase(this._repository);
  final ES_CustomerRepository _repository;

  @override
  ResultFuture<ES_Customer> call(CreateCustomerParams params) async {
    return await _repository.create(params: params);
  }
}
