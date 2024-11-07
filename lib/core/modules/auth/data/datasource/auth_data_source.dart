import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;
import 'package:http/http.dart' as http;

import '../../../../data/datasource/mobilesv_data_source.dart';
import '../../../../errors/exceptions.dart';
import '../../../../utils/typedef.dart';
import '../../domain/entities/org.dart';
import '../../domain/entities/sso_data.dart';
import '../models/auth_result.dart';
import '../models/inos_user_model.dart';
import '../models/org_model.dart';
import '../models/sso_data_model.dart';
abstract class AuthDataSrc {
  Future<AuthResultModel> login(
      {required String email, required String password});

  Future<UserModel> getCurrentUser();
  Future<List<Org>> getMyNetworks();
  Future<UserModel> saveUserProfile(
      {
      required String name,
      String avatar,
      String language,
      String currentPassword,
      String newPassword});

  Future<SSOData?> getSSOData();
  Future<void> saveSSOData({required String data});
}

class AuthRemoteDataSrc extends MobileSvDataSrc implements AuthDataSrc {
  const AuthRemoteDataSrc(super.client);

  @override
  Future<AuthResultModel> login(
      {required String email, required String password}) async {
    final params = {
      'email': email,
      'password': password,
    };

    final response = await post(path: 'accountapi/login', params: params);

    return AuthResultModel.fromMap(response);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response =
    await post(path: 'accountapi/getcurrentuser', params: null);


    final ret= UserModel.fromMap(response);
    return ret;
  }

  @override
  Future<UserModel> saveUserProfile({
    required String name,
    String avatar = '',
    String language = '',
    String currentPassword = '',
    String newPassword = ''}) async {
    String img64 = '';
    if (avatar.isNotEmpty) {
      final bytes = io.File(avatar).readAsBytesSync();

      img64 = base64Encode(bytes);
    }


    final response =
    await post(path: 'accountapi/editprofile', params: {
      'name': name,
      'avatar': img64,
      'language': language,
      'currentPassword': currentPassword,
      'newPassword': newPassword,


    });

    return UserModel.fromMap(response);
  }

  @override
  Future<SSOData?> getSSOData() async {
    // TODO: implement getSSOData
    throw UnimplementedError();
  }

  @override
  Future<void> saveSSOData({required String data}) async {
    // TODO: implement saveSSOData
    throw UnimplementedError();
  }

  @override
  Future<List<Org>> getMyNetworks() async {


    // final list= [
    //   Org(Id: 3183313000, ParentId: 0, Name: 'Idocnet', ShortName: 'idocNet'),
    //   Org(Id: 7206207001, ParentId: 0, Name: 'Cty CP Quốc tế Long Quang', ShortName: 'Cty CP Quốc tế Long Quang'),
    // ];
    // return list;

    try {
      final response =
      await post(path: 'accountapi/getMyNetworks', params: null);

      final list = response.map((entry) =>
          OrgModel.fromMap(entry as DataMap)).toList();
      return new List<Org>.from(list);
    }
    on ApiException  catch(ax){
      throw ax;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }
}

class AuthRemoteDataSrc_Fake implements AuthDataSrc {
  const AuthRemoteDataSrc_Fake(this._client);

  final http.Client _client;

  @override
  Future<AuthResultModel> login(
      {required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 1), () {});
    return AuthResultModel(
        AccessToken: "123", ExpiredIn: 1000, RefreshToken: "rrr");
  }

  @override
  Future<UserModel> getCurrentUser() async {
    return UserModel(
        Name: 'user1',
        Language: 'en',
        Avatar:
            'https://test.inos.vn/Uploads/24/0108/13404f33-bb28-47bd-8ecb-1b0a39d92502.png',
        Id: 1000,
        Email: 'test@idocnet.com',
        Phone: '');
  }

  @override
  Future<UserModel> saveUserProfile(
      {
      required String name,
      String avatar = '',
      String language = '',
      String currentPassword = '',
      String newPassword = ''}) async {



    return UserModel(
        Name: name,
        Language: language ?? 'vi',
        Avatar:
            'https://test.inos.vn/Uploads/24/0108/13404f33-bb28-47bd-8ecb-1b0a39d92502.png',
        Id: 1000,
        Email: 'test@idocnet.com',
        Phone: '');
  }

  @override
  Future<SSODataModel?> getSSOData() async{
    return null;
  }

  @override
  Future<void> saveSSOData({required String data})  async{
    // TODO: implement saveSSOData
    throw UnimplementedError();
  }

  @override
  Future<List<Org>> getMyNetworks() async{
    final list= [Org(Id: 1000, ParentId: 0, Name: 'Idocnet', ShortName: ''),
      Org(Id: 1000, ParentId: 0, Name: 'Ctcp quoc te Long Quang ', ShortName: '')];
    return list;
  }
}
