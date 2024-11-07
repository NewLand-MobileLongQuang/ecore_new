import '../../../../utils/typedef.dart';
import '../entities/auth_result.dart';
import '../entities/inos_user.dart';
import '../entities/org.dart';
import '../entities/sso_data.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<AuthResult> login(
      {required String email, required String password});

  ResultFuture<InosUser> getCurrentUser();

  ResultFuture<List<Org>> getMyNetworks();

  ResultFuture<SSOData?> getSSOData();

  ResultVoid saveSSOData({required String data});

  ResultFuture<InosUser> saveUserProfile(
      {required String name,
        String avatar,
        String language,
        String currentPassword,
        String newPassword});
}
