import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class FinishROParams extends Equatable {
  const FinishROParams({required this.RONo, required this.FinishDTimeUser});

  final String RONo;
  final String FinishDTimeUser;

  @override
  List<Object?> get props => [RONo, FinishDTimeUser];

  Map<String, dynamic> toMap() {
    return {
      'RONo': RONo,
      'FinishDTimeUser': FinishDTimeUser,
    };
  }
}

class FinishROUseCase extends UsecaseWithParams<void, FinishROParams> {
  FinishROUseCase(this._repo);
  final ES_RORepository _repo;

  @override
  ResultFuture<void> call(FinishROParams params) async {
    return _repo.finish(params: params);
  }
}