
import '../../../../utils/typedef.dart';
import '../entities/sys_user.dart';

abstract class ClientServiceRepo {
  ResultFuture<DataUser> getForCurrentUser();
}