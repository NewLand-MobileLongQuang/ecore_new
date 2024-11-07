import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/org.dart';
import '../repos/auth_repo.dart';

class GetMyNetworks extends UsecaseWithoutParams<List<Org>>
{

  const GetMyNetworks(this._repo);
  final AuthRepo _repo;


  // ResultFuture<AuthResult> login({required String email, required String password})
  // async=> _repo.login(email: email, password: password);

  @override
  ResultFuture<List<Org> > call() async => _repo.getMyNetworks();
}