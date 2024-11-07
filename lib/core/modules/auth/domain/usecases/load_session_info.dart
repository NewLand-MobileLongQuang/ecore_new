
import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/session_info.dart';
import '../repos/local_session_repo.dart';

class LoadSessionInfo extends UsecaseWithoutParamsSync<SessionInfo?> {
  const LoadSessionInfo(this._repo);

  final LocalSessionRepo _repo;

  @override
  ResultSync<SessionInfo?> call() =>_repo.loadSessionInfo();

}
