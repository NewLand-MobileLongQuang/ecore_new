import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';

class CreateCustomerSkyCSParams extends Equatable {
  const CreateCustomerSkyCSParams({required this.strJson, required this.strJsonZaloUserFollower, required this.strJsonEmail, required this.strJsonPhone, required this.strJsonCtmGroup, required this.strJsonCtmPartnerType, required this.strJsonUserManager, required this.strJsonGovID, required this.ScrTplCodeSys});

  final String strJson;
  final String strJsonZaloUserFollower;
  final String strJsonEmail;
  final String strJsonPhone;
  final String strJsonCtmGroup;
  final String strJsonCtmPartnerType;
  final String strJsonUserManager;
  final String strJsonGovID;
  final String ScrTplCodeSys;

  @override
  List<Object?> get props => [strJson, strJsonZaloUserFollower, strJsonEmail, strJsonPhone, strJsonCtmGroup, strJsonCtmPartnerType, strJsonUserManager, strJsonGovID, ScrTplCodeSys];
}

class CreateCustomerSkyCSUseCase extends UsecaseWithParams<String, CreateCustomerSkyCSParams> {
  CreateCustomerSkyCSUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<String> call(CreateCustomerSkyCSParams params) async {
    return await _repository.createCustomerSkyCS(params: params);
  }
}