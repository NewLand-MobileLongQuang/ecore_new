import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_partner_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';


class GetAllCustomerPartnerTypeParams extends Equatable {
  const GetAllCustomerPartnerTypeParams();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllCustomerPartnerTypeUseCase extends UsecaseWithParams<List<SKY_CustomerPartnerType>, GetAllCustomerPartnerTypeParams> {
  GetAllCustomerPartnerTypeUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<List<SKY_CustomerPartnerType>> call(GetAllCustomerPartnerTypeParams params) async {
    return await _repository.getAllCustomerPartnerType(params: params);
  }

}