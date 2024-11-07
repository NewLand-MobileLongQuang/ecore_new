
import '../../../../utils/typedef.dart';
import '../entities/object_result.dart';
import '../entities/sys_user.dart';

abstract class EntryCenterGateRepo {
  ResultFuture<List<ObjectResult>> getByNetworks({required String solutionCode, required String networkId});
  ResultFuture<DataUser> getForCurrentUser();
}