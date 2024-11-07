import '../../../../utils/typedef.dart';
import '../entities/session_info.dart';

abstract class LocalSessionRepo {
  const LocalSessionRepo();

  ResultVoid saveSessionInfo({required SessionInfo? info});

  ResultSync<SessionInfo?> loadSessionInfo();
}
