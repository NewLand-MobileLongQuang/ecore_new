import 'package:equatable/equatable.dart';

class AuthResult extends Equatable
{
  const AuthResult({required this.AccessToken, required this.RefreshToken, required this.ExpiredIn});
  final  String AccessToken;
  final  String RefreshToken;
  final  int ExpiredIn;


  @override
  List<Object?> get props => [AccessToken, RefreshToken, ExpiredIn];

}
