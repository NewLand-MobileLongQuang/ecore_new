
import 'package:ecore/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/typedef.dart';
import '../../../../../core/modules/auth/domain/entities/sys_user.dart';
import '../../../../../core/modules/auth/domain/repos/entry_center_gate_repo.dart';

class GetForCurrentUser extends UsecaseWithoutParams<SysUser> {
  GetForCurrentUser(this._repo);
  final ES_WarrantyRepository _repo;

  @override
  ResultFuture<SysUser> call() {
    return _repo.getForCurrentUser();
  }
}