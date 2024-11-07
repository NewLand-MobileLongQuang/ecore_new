import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/session_info.dart';
import '../repos/local_session_repo.dart';

class SaveSessionInfo extends UsecaseWithParams<void, SessionInfo?> {
  const SaveSessionInfo(this._repo);

  final LocalSessionRepo _repo;

  @override
  ResultVoid call(SessionInfo? params) async =>
      _repo.saveSessionInfo(info: params);
}
