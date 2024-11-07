import 'package:equatable/equatable.dart';

import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/auth_result.dart';
import '../repos/auth_repo.dart';


class LoginParams extends Equatable{
  const LoginParams({
    required this.email,
    required this.password
  });
  final String email;
  final String password;
  @override
  List<Object?> get props => [email, password];

}

class Login extends UsecaseWithParams<AuthResult, LoginParams>
{
  const Login(this._repo);
  final AuthRepo _repo;


  // ResultFuture<AuthResult> login({required String email, required String password})
  // async=> _repo.login(email: email, password: password);

  @override
  ResultFuture<AuthResult> call(LoginParams params) async => _repo.login(email: params.email, password: params.password);
}