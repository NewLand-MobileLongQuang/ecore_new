import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/sso_data.dart';
import '../repos/auth_repo.dart';




class GetSSOData extends UsecaseWithoutParams<SSOData?>
{
  const GetSSOData(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<SSOData?> call() => _repo.getSSOData();

}