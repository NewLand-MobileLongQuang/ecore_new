import 'package:dartz/dartz.dart';

import '../../../../errors/exceptions.dart';
import '../../../../errors/failure.dart';
import '../../../../utils/typedef.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/entities/inos_user.dart';
import '../../domain/entities/org.dart';
import '../../domain/entities/sso_data.dart';
import '../../domain/repos/auth_repo.dart';
import '../datasource/auth_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl(this._datasource);

  final AuthDataSrc _datasource;

  @override
  ResultFuture<AuthResult> login(
      {required String email, required String password}) async {
    //Test-driven development
    //call remote data source
    //check if data source return the proper data
    // // check if when data source throw an exception, return a failure
    //and if it doesn't , return expected data
    try {
      final result = await _datasource.login(email: email, password: password);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }

  }

  @override
  ResultFuture<InosUser> getCurrentUser() async {
    try {
      final result = await _datasource.getCurrentUser();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<InosUser> saveUserProfile(
      {
      required String name,
      String avatar = '',
      String language = '',
      String currentPassword = '',
      String newPassword = ''}) async {
    try {
      final result = await _datasource.saveUserProfile(
          name: name,
          avatar: avatar,
          currentPassword: currentPassword,
          language: language,
          newPassword: newPassword);

      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SSOData?> getSSOData() async {
    try {
      final result = await _datasource.getSSOData();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid saveSSOData({required String data}) async {
    try {
      final result = await _datasource.saveSSOData(data: data);

      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Org>> getMyNetworks() async {
    try {
      final result = await _datasource.getMyNetworks();
      return Right(result);
    }

    on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
    on Exception catch(x)
    {


      return Left(ApiFailure(Message: x.toString(), Code:''));

    }
  }


// @override
// ResultFuture<InosUser> saveUserProfile({required String accessToken, required String name, required String avatar, required int timeZone}) async{
//   try {
//     final result =
//     await this._datasource.saveUserProfile(accessToken: accessToken, name: name, avatar: avatar, timeZone: timeZone);
//
//     return Right(result);
//   }
//   on ApiException catch(e)
//   {
//     return Left(ApiFailure.fromException(e));
//   }
// }
}
