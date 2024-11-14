import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';

class DeleteCustomerParams extends Equatable {
  const DeleteCustomerParams({required this.strJson});

  final String strJson;

  @override
  List<Object?> get props => [
    strJson,
  ];

  Map<String, dynamic> toMap() {
    return {
      'strJson': strJson,
    };
  }
}

class DeleteCustomerUseCase extends UsecaseWithParams<String, DeleteCustomerParams> {
  DeleteCustomerUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<String> call(DeleteCustomerParams params) async {
    return await _repository.deleteCustomerSkyCS(params: params);
  }
}