
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/agent.dart';
import '../entities/call_log.dart';
import '../repos/call_repo.dart';




class RedirectCurrentCall extends UsecaseWithParams<CallLog, String>
{
  const RedirectCurrentCall(this._repo);
  final CallRepo _repo;

  @override
  ResultFuture<CallLog> call(String target)=>_repo.redirect(target);

}