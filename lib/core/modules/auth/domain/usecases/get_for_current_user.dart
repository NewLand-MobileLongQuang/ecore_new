
import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/sys_user.dart';
import '../repos/entry_center_gate_repo.dart';

class GetForCurrentUser extends UsecaseWithoutParams<DataUser> {
  GetForCurrentUser(this._repo);
  final EntryCenterGateRepo _repo;

  @override
  ResultFuture<DataUser> call() {
    return _repo.getForCurrentUser();
  }
}