import '../../../../core/utils/typedef.dart';
import '../entities/agent.dart';
import '../entities/call_log.dart';
import '../entities/calling_info.dart';

abstract class CallRepo {
  const CallRepo();

  

  ResultFuture<CallingInfo> getCallingInfo();
  ResultFuture<List<CallLog>> getCallLog();
  ResultFuture<List<Agent>> getAgentList();
  ResultFuture<CallLog> redirect(String target);

}
