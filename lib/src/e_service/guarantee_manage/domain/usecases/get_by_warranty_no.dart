import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

class GetByWarrantyNoParams extends Equatable {
  const GetByWarrantyNoParams({required this.WarrantyNo});
  final String WarrantyNo;

  @override
  List<Object?> get props => [WarrantyNo];

}

class GetByWarrantyNoUseCase extends UsecaseWithParams<RT_ES_WarrantyDetail, GetByWarrantyNoParams> {
  GetByWarrantyNoUseCase(this._repository);
  final ES_WarrantyRepository _repository;

  @override
  ResultFuture<RT_ES_WarrantyDetail> call(GetByWarrantyNoParams params) async {
    return await _repository.getByWarrantyNo(params: params);
  }
}