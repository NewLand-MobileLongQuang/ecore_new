import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';

class GetByCustomerCodeSysParams extends Equatable {
  const GetByCustomerCodeSysParams({required this.ScrTplCodeSys, required this.CustomerCodeSys, required this.Ft_PageIndex, required this.Ft_PageSize});

  final String ScrTplCodeSys;
  final String CustomerCodeSys;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  @override
  List<Object?> get props => [ScrTplCodeSys, CustomerCodeSys, Ft_PageIndex, Ft_PageSize];

  Map<String, dynamic> toMap() {
    return {
      'ScrTplCodeSys': ScrTplCodeSys,
      'CustomerCodeSys': CustomerCodeSys,
      'Ft_PageIndex': Ft_PageIndex,
      'Ft_PageSize': Ft_PageSize,
    };
  }
}

class GetByCustomerCodeSysUseCase extends UsecaseWithParams<SKY_CustomerDetail, GetByCustomerCodeSysParams> {
  GetByCustomerCodeSysUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<SKY_CustomerDetail> call(GetByCustomerCodeSysParams params) async {
    return await _repository.getByCustomerCodeSys(params: params);
  }
}
