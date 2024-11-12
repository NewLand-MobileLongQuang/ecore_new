import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rt_sky_customer_all_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';

class GetAllByCustomerCodeSysParams extends Equatable{

  const GetAllByCustomerCodeSysParams({
    required this.CustomerCodeSys,
  });

  final String CustomerCodeSys;

  @override
  List<Object?> get props => [CustomerCodeSys];
}

class GetAllByCustomerCodeSysUseCase extends UsecaseWithParams<RT_SKY_CustomerAllDetail, GetAllByCustomerCodeSysParams> {
  GetAllByCustomerCodeSysUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<RT_SKY_CustomerAllDetail> call(GetAllByCustomerCodeSysParams params) async {
    return await _repository.getAllByCustomerCodeSys(params: params);
  }
}