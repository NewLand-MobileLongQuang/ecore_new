import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecore/core/modules/auth/domain/usecases/get_current_user.dart';
import 'package:ecore/core/modules/auth/domain/usecases/load_session_info.dart';
import 'package:ecore/core/modules/localization/data/models/locale_item_model.dart';
import 'package:ecore/core/modules/localization/domain/usecases/add_locale_remotedata.dart';
import 'package:ecore/core/modules/localization/domain/usecases/get_locale_remote_data.dart';
import 'package:ecore/core/modules/localization/domain/usecases/save_locale_localdata.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/call/domain/usecases/get_calling_info.dart';
import 'package:flutter/cupertino.dart';

import 'package:sip_ua/sip_ua.dart';

import '../../../../core/modules/auth/domain/entities/session_info.dart';
import '../../../../core/modules/auth/domain/usecases/save_session_info.dart';
import '../../../../core/modules/localization/domain/usecases/get_locale_local_data.dart';
import '../../../../core/services/injection_container.dart';
part 'init_session_state.dart';

class InitSessionCubit extends Cubit<InitSessionState> {
  InitSessionCubit({
    required LoadSessionInfo loadSessionInfo,
    required SaveSessionInfo saveSessionInfo,
    required GetCurrentUser getCurrentUser,
    required GetCallingInfo getCallingInfo,
  })  : _loadSessionInfo = loadSessionInfo,
        _saveSessionInfo = saveSessionInfo,
        _getCurrentUser = getCurrentUser,
        _getCallingInfo = getCallingInfo,
        super(InitSessionInitial());
  final SaveSessionInfo _saveSessionInfo;
  final LoadSessionInfo _loadSessionInfo;
  final GetCurrentUser _getCurrentUser;
  final GetCallingInfo _getCallingInfo;

  final GetLocaleRemoteData _getLocaleRemoteData = sl<GetLocaleRemoteData>();
  final GetLocaleLocalData _getLocaleLocalData = sl<GetLocaleLocalData>();
  final SaveLocaleLocalData _saveLocaleLocalData = sl<SaveLocaleLocalData>();
  final AddLocaleRemoteData _addLocaleRemoteData = sl<AddLocaleRemoteData>();

  Future<void> init() async {
    final result = _loadSessionInfo();

    result.fold((failure) => emit(InitSessionLogin()), (session) async {
      if (session == null) {
        Future.delayed(Duration.zero, () {
          emit(InitSessionLogin());
        });

        return;
      }

      await _initLocalization();
      final cUserResult = await _getCurrentUser(session.auth.AccessToken);
      cUserResult.fold((failure) {
        emit(InitSessionLogin());
      }, (user) async {
        if (user == null) {
          Future.delayed(Duration.zero, () {
            emit(InitSessionLogin());
          });
          return;
        }

        if (session?.org == null) {
          Future.delayed(Duration.zero, () {
            emit(InitSessionSelectNetwork());
          });
          return;
        } else {
          final callResult = await _getCallingInfo();
          callResult.fold((failure) async {
            //emit(InitSessionLogin());

            final ss = SessionInfo(
              user: SessionInfo.current().user,
              auth: SessionInfo.current().auth,
              org: SessionInfo.current().org,
              cacheData: SessionInfo.current().cacheData,
              callingInfo: null,
            );
            await _saveSessionInfo(ss);

            Future.delayed(Duration.zero, () {
              emit(InitSessionOk());
            });
          }, (cinfo) async {
            final ss = SessionInfo(
              user: SessionInfo.current().user,
              auth: SessionInfo.current().auth,
              org: SessionInfo.current().org,
              cacheData: SessionInfo.current().cacheData,
              callingInfo: cinfo,
            );
            await _saveSessionInfo(ss);

            Future.delayed(Duration.zero, () {
              emit(InitSessionSaveSession(sessionInfo: ss));
            });
            return;

            //return emit(InitSessionInitCall());
            //emit(AuthNetworkSelected(network: network));
          });

          //  return emit(InitSessionOk());
        }
      });
    });

    //emit(AuthNetworkSelected(network: network));
  }

  List<AddLocaleItemModel> _mergeData(DataMap fromData, DataMap toData) {
    List<AddLocaleItemModel> addList = [];

    fromData.keys.forEach((key) {
      late List<LocaleItemModel> fromList;
      late List<dynamic> toList;

      if (fromData[key] != null) {
        fromList= (fromData[key] as List).map<LocaleItemModel>((e) => e as LocaleItemModel ).toList();

        if (toData[key] == null) {
          toList = [];
          toData[key] = toList;
        } else
          toList= (toData[key] as List).map<LocaleItemModel>((e) => e as LocaleItemModel).toList();

        fromList.forEach((item){
          if (!toList.contains(item)) {
            toList.add(item);
            addList.add(AddLocaleItemModel(key, item.key));
          }
        });
      }
    });

    return addList;
  }

  Future<void> _initLocalization() async {
    final remoteDataResult = await _getLocaleRemoteData();

    remoteDataResult.fold((l) => {}, (remoteData) async {
      final localDataResult = _getLocaleLocalData();

      localDataResult.fold((l) => null, (localData) async {
        if (localData != null) {

          final addListRemote = _mergeData(remoteData, localData);

          if (addListRemote.isNotEmpty) {
            _saveLocaleLocalData(localData);
          }

          final addListLocal = _mergeData(localData, remoteData);
          if (addListLocal.isNotEmpty) {
            _addLocaleRemoteData(addListLocal);
          }
        }
        _saveLocaleLocalData(remoteData);
      });
    });
  }
}
