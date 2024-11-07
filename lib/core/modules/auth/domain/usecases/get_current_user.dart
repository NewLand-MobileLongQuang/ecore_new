import 'package:equatable/equatable.dart';
import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/inos_user.dart';
import '../repos/auth_repo.dart';




class GetCurrentUser extends UsecaseWithParams<InosUser, String>
{
  const GetCurrentUser(this._repo);
  final AuthRepo _repo;


  // ResultFuture<AuthResult> login({required String email, required String password})
  // async=> _repo.login(email: email, password: password);

  @override
  ResultFuture<InosUser> call(String params) async => _repo.getCurrentUser();
}