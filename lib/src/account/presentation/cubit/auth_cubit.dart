import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/modules/auth/domain/entities/org.dart';
import '../../../../core/modules/auth/domain/entities/session_info.dart';
import '../../../../core/modules/auth/domain/usecases/get_by_networks.dart';
import '../../../../core/modules/auth/domain/usecases/get_current_user.dart';
import '../../../../core/modules/auth/domain/usecases/get_for_current_user.dart';
import '../../../../core/modules/auth/domain/usecases/get_my_networks.dart';
import '../../../../core/modules/auth/domain/usecases/get_sso_data.dart';
import '../../../../core/modules/auth/domain/usecases/login.dart';
import '../../../../core/modules/auth/domain/usecases/save_session_info.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required Login login,
    required GetCurrentUser getCurrentUser,
    required SaveSessionInfo saveSessionInfo,
    required GetMyNetworks getMyNetworks,
    required GetSSOData getSSOData,
    required GetByNetworks getByNetworks,
    required GetForCurrentUser getForCurrentUser,
  })  : _login = login,
        _getCurrentUser = getCurrentUser,
        _saveSessionInfo = saveSessionInfo,
        _getMyNetworks = getMyNetworks,
        _getSSOData = getSSOData,
        _getByNetworks = getByNetworks,
        _getForCurrentUser = getForCurrentUser,
        super(AuthInitial());

  final Login _login;
  final GetCurrentUser _getCurrentUser;
  final SaveSessionInfo _saveSessionInfo;
  final GetMyNetworks _getMyNetworks;
  final GetSSOData _getSSOData;
  final GetByNetworks _getByNetworks;
  final GetForCurrentUser _getForCurrentUser;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('cached_email') ?? '';
    final password = prefs.getString('cached_password') ?? '';
    final rememberMe = prefs.getBool('remember_me') ?? false;
    if(rememberMe == true) {
      emit(AuthStateLoaded(email: email, password: password, rememberMe: rememberMe));
    }
    else {
      emit(AuthStateLoaded(email: '', password: '', rememberMe: rememberMe));
    }
  }

  Future<void> login({required String email, required String password, required bool rememberMe}) async {
    final currentState = state;
    emit(const AuthStateLoading());
    final result = await _login(LoginParams(email: email, password: password));

    result.fold((failure) {
      emit(AuthError(message: failure.Message??""));
      emit(currentState);
    },
        (r) async {
      SessionInfo.reset();
      final empty=SessionInfo.current();
      final session1 = SessionInfo(user: empty.user, auth: r);
      await _saveSessionInfo(session1);

      await _saveEmailToCache(email, password, rememberMe);

      final cresult = await _getCurrentUser(r.AccessToken);

      SessionInfo.reset();

      cresult.fold((failure1) => emit(AuthError(message: failure1.Message??"")),
          (r1) async {
        //login, get current user ok
        final session = SessionInfo(user: r1, auth: r);
        await _saveSessionInfo(session);

        SessionInfo.reset();
        emit(AuthSignedIn(session: session));
      });
    });
  }

  Future<void> getNetworks() async {
    emit(const AuthStateLoading());
    final result = await _getMyNetworks();

    result.fold((failure) => emit(AuthError(message: failure.Message??"")), (list) {
      emit(AuthNetworkListLoaded(networks: list));
    });
  }

  Future<void> selectNetwork({required Org network}) async {
    await _saveSessionInfo(SessionInfo(
        user: SessionInfo.current().user,
        auth: SessionInfo.current().auth,
        cacheData: SessionInfo.current().cacheData,
        org: network));

    //
    // final networkSearch = network.ParentId == 0 ? network.Id : network.ParentId;
    // final test = await _getByNetworks.call(GetByNetworksParams(networkId: networkSearch.toString()));
    //
    // //TEST client service
    // final baseUrl = test.fold((l) => '', (r) => r[0].WSUrlAddr);
    //
    // SessionInfo.setCacheData('ApiUrl_EService', baseUrl);

    // await _saveSessionInfo(SessionInfo(
    //     user: SessionInfo.current().user,
    //     auth: SessionInfo.current().auth,
    //     org: network,
    //     solutionAPI: baseUrl));



    emit(AuthNetworkSelected(network: network));
  }

  Future<void> _saveEmailToCache(String email, String password, bool rememberMe) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cached_email', email);
    await prefs.setString('cached_password', password);
    await prefs.setBool('remember_me', rememberMe);
  }
}
