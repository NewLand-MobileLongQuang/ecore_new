import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/customer_manage/domain/repos/es_customer_repo.dart';

class GetCustomerCodeSysParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetCustomerCodeSysUseCase extends UsecaseWithParams<String, GetCustomerCodeSysParams> {
  GetCustomerCodeSysUseCase(this._repository);
  final ES_CustomerRepository _repository;

  @override
  ResultFuture<String> call(GetCustomerCodeSysParams params) async {
    return await _repository.getCustomerCodeSys(params: params);
  }
}