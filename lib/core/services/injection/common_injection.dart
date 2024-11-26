import 'package:ecore/core/modules/localization/data/datasource/localization_data_source.dart';
import 'package:ecore/core/modules/localization/domain/repos/localization_repo.dart';
import 'package:ecore/core/modules/localization/domain/usecases/get_locale_local_data.dart';
import 'package:ecore/core/modules/localization/domain/usecases/save_locale_localdata.dart';
import 'package:ecore/src/account/presentation/cubit/init_session_cubit.dart';
import 'package:ecore/src/call/data/datasource/call_data_source.dart';
import 'package:ecore/src/call/data/repos/call_repo_impl.dart';
import 'package:ecore/src/call/domain/entities/calling_info.dart';
import 'package:ecore/src/call/domain/repos/call_repo.dart';
import 'package:ecore/src/call/domain/usecases/get_agent_list.dart';
import 'package:ecore/src/call/domain/usecases/get_call_log.dart';
import 'package:ecore/src/call/domain/usecases/get_calling_info.dart';
import 'package:ecore/src/call/domain/usecases/redirect_current_call.dart';
import 'package:ecore/src/call/presentation/cubit/dialpad_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../src/account/presentation/cubit/auth_cubit.dart';
import '../../../src/call/presentation/cubit/call_register_cubit.dart';
import '../../modules/auth/data/datasource/auth_data_source.dart';
import '../../modules/auth/data/datasource/entry_center_gate_data_source.dart';
import '../../modules/auth/data/datasource/session_info_local_data_src.dart';
import '../../modules/auth/data/repos/auth_repo_impl.dart';
import '../../modules/auth/data/repos/entry_center_gate_repo_impl.dart';
import '../../modules/auth/data/repos/local_session_repo_impl.dart';
import '../../modules/auth/domain/repos/auth_repo.dart';
import '../../modules/auth/domain/repos/entry_center_gate_repo.dart';
import '../../modules/auth/domain/repos/local_session_repo.dart';
import '../../modules/auth/domain/usecases/get_by_networks.dart';
import '../../modules/auth/domain/usecases/get_current_user.dart';
import '../../../src/e_service/guarantee_manage/domain/usecases/get_for_current_user.dart';
import '../../modules/auth/domain/usecases/get_my_networks.dart';
import '../../modules/auth/domain/usecases/get_sso_data.dart';
import '../../modules/auth/domain/usecases/load_session_info.dart';
import '../../modules/auth/domain/usecases/login.dart';
import '../../modules/auth/domain/usecases/save_session_info.dart';
import '../../modules/auth/domain/usecases/save_user_profile.dart';

import 'package:http/http.dart' as http;

import '../../modules/localization/data/repos/localization_repo_impl.dart';
import '../../modules/localization/domain/usecases/add_locale_remotedata.dart';
import '../../modules/localization/domain/usecases/get_locale_remote_data.dart';
import 'injection_container.dart';

Future<void> authInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerFactory(() => AuthCubit(
        login: sl(),
        getCurrentUser: sl(),
        saveSessionInfo: sl(),
        getMyNetworks: sl(),
        getByNetworks: sl(),
        getForCurrentUser: sl(),
        getSSOData: sl()))
    ..registerLazySingleton(() => SaveUserProfile(sl()))
    ..registerLazySingleton(() => SaveSessionInfo(sl()))
    ..registerLazySingleton(() => LoadSessionInfo(sl()))
    ..registerLazySingleton(() => Login(sl()))
    ..registerLazySingleton(() => GetCurrentUser(sl()))
    ..registerLazySingleton(() => GetMyNetworks(sl()))
    ..registerLazySingleton(() => GetSSOData(sl()))
    ..registerLazySingleton(() => GetByNetworks(sl()))
    ..registerLazySingleton(() => GetForCurrentUser(sl()))
    ..registerLazySingleton<LocalSessionRepo>(() => LocalSessionRepoImpl(sl()))
    ..registerLazySingleton<SessionInfoLocalDataSrc>(
        () => SessionInfoLocalDataSrcImpl(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthDataSrc>(() => AuthRemoteDataSrc(sl()))
    ..registerLazySingleton<EntryCenterGateRepo>(
        () => EntryCenterGateRepoImpl(sl()))
    ..registerLazySingleton<EntryCenterGateDataSource>(
        () => EntryCenterGateRemoteDataSource(sl()))
    ..registerLazySingleton<EntryCenterGateRemoteDataSource>(
        () => EntryCenterGateRemoteDataSource(sl()))

    //  ..registerLazySingleton<AuthDataSrc>(() => AuthRemoteDataSrc_Fake(sl()))
    //..registerLazySingleton(()=>http.Client());
    ..registerLazySingleton(() => prefs)
    ..registerFactory(() => InitSessionCubit(
        loadSessionInfo: sl(),
        saveSessionInfo: sl(),
        getCurrentUser: sl(),
        getCallingInfo: sl()))
    ..registerLazySingleton(http.Client.new);
}

Future<void> callInit() async {
  sl
    //..registerFactory(() => ProfileCubit(saveUserProfile: sl(), saveSessionInfo: sl()))
    ..registerLazySingleton(() => GetCallingInfo(sl()))
    ..registerLazySingleton(() => GetAgentList(sl()))
    ..registerLazySingleton(() => GetCallLog(sl()))
    ..registerLazySingleton(() => RedirectCurrentCall(sl()))
    ..registerLazySingleton<CallRepo>(() => CallRepoImpl(sl()))
    ..registerLazySingleton<CallDataSrc>(() => CallRemoteDataSrc(sl()))
    ..registerFactory(() => DialpadCubit())

    ..registerFactory(() => CallRegisterCubit());
}

Future<void> localizationInit() async {
  sl
    ..registerLazySingleton(() => AddLocaleRemoteData(sl()))
    ..registerLazySingleton(() => GetLocaleRemoteData(sl()))
    ..registerLazySingleton(() => SaveLocaleLocalData(sl()))
    ..registerLazySingleton(() => GetLocaleLocalData(sl()))
    ..registerLazySingleton<LocalizationDataSrc>(
        () => LocalizationDataSrcImpl(sl(), sl()))
    ..registerLazySingleton<LocalizationRepo>(() => LocalizationRepoImpl(sl()));
}
