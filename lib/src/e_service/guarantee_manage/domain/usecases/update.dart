import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

class UpdateWarrantyParams extends Equatable {
  const UpdateWarrantyParams({required this.strJson});
  final String strJson;

  @override
  List<Object?> get props => [strJson];

  Map<String, dynamic> toMap() {
    return {
      'strJson': strJson,
    };
  }
}

class UpdateWarrantyUseCase extends UsecaseWithParams<void, UpdateWarrantyParams>{
  UpdateWarrantyUseCase(this._repo);
  final ES_WarrantyRepository _repo;

  @override
  ResultFuture<void> call(UpdateWarrantyParams params) async {
    print("LOG_CHECK_API: tessssssssssssst ${params.strJson}");
    return _repo.update(params: params);
  }
}