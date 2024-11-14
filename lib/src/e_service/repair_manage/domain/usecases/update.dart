import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class UpdateROParams extends Equatable {
  const UpdateROParams({required this.strJson});

  final String strJson;

  @override
  List<Object?> get props => [strJson];

  Map<String, dynamic> toMap() {
    return {
      'strJson': strJson,
    };
  }
}

class UpdateROUseCase extends UsecaseWithParams<void, UpdateROParams>{
  UpdateROUseCase(this._repo);
  final ES_RORepository _repo;

  @override
  ResultFuture<void> call(UpdateROParams params) async {
    return _repo.update(params: params);
  }
}