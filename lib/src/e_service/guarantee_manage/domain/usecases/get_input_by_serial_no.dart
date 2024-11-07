import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

class GetInputBySerialNoParams extends Equatable {
  const GetInputBySerialNoParams({required this.SerialNo});
  final String SerialNo;

  @override
  List<Object?> get props => [SerialNo];
}

class GetInputBySerialNoUseCase extends UsecaseWithParams<List<RT_ES_WarrrantyActivateByQR>, GetInputBySerialNoParams> {
  GetInputBySerialNoUseCase(this._repository);
  final ES_WarrantyRepository _repository;

  @override
  ResultFuture<List<RT_ES_WarrrantyActivateByQR>> call(GetInputBySerialNoParams params) async {
    return await _repository.getInputBySerialNo(params: params);
  }
}