import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

class DeleteWarrantyParams extends Equatable {
  const DeleteWarrantyParams({required this.strJson});

  final String strJson;

  @override
  List<Object?> get props => [strJson];

  Map<String, dynamic> toMap() {
    return {
      'strJson': strJson,
    };
  }
}

class DeleteWarrantyUseCase extends UsecaseWithParams <void, DeleteWarrantyParams>{
  DeleteWarrantyUseCase(this._repo);
  final ES_WarrantyRepository _repo;

  @override
  ResultFuture<void> call(DeleteWarrantyParams params) async {
    return _repo.delete(params: params);
  }
}