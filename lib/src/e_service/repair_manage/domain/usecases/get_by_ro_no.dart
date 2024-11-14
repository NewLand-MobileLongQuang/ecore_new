import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/rt_es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class GetByRONoParams extends Equatable {
  const GetByRONoParams({required this.RONo});

  final String RONo;

  @override
  List<Object?> get props => [RONo];

  Map<String, dynamic> toMap() {
    return {
      'RONo': RONo,
    };
  }
}

class GetByRONoUseCase extends UsecaseWithParams<RT_ES_RODetail, GetByRONoParams> {
  GetByRONoUseCase(this._repository);
  final ES_RORepository _repository;

  @override
  ResultFuture<RT_ES_RODetail> call(GetByRONoParams params) async {
    return await _repository.getByRONo(params: params);
  }
}