part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {


}

final class AuthSigningIn extends AuthState
{
  const AuthSigningIn({required this.email, required this.password});

  final String email;
  final String password;

}


final class AuthStateLoading extends AuthState
{
  const AuthStateLoading();

}

final class AuthSignedIn extends AuthState
{
  const AuthSignedIn({required this.session});

  final SessionInfo session;
  //final AuthResult authResult;
  //final InosUser currentUser;


}



final class AuthNetworkListLoaded extends AuthState
{
  const AuthNetworkListLoaded({required this.networks});

  final List<Org> networks;


}



final class AuthNetworkSelected extends AuthState
{
  const AuthNetworkSelected({required this.network});

  final Org network;


}

final class AuthError extends AuthState {

  const AuthError({required this.message});

  final String message;

}
