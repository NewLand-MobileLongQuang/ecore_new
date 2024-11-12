import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:equatable/equatable.dart';


class GetListOptionParams extends Equatable{
  const GetListOptionParams({
    required this.ScrTplCodeSys,
    required this.ColCodeSys,
    required this.FlagActive,
  });

  final String ScrTplCodeSys;
  final String ColCodeSys;
  final String FlagActive;

  @override
  List<Object?> get props => [
    ScrTplCodeSys,
    ColCodeSys,
    FlagActive,
  ];
}

class GetListOptionUseCase extends UsecaseWithParams<List<SKY_CustomerColumn>, GetListOptionParams> {
  GetListOptionUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<List<SKY_CustomerColumn>> call(GetListOptionParams params) async {
    return await _repository.getListOption(params: params);
  }
}