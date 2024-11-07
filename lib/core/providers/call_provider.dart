import 'package:ecore/core/services/app_background_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:sip_ua/sip_ua.dart';

import '../modules/auth/domain/entities/inos_user.dart';
import '../modules/auth/domain/entities/session_info.dart';

class CallProvider extends ChangeNotifier
//    implements SipUaHelperListener
    {
  late SIPUAHelper? _callHelper;

  CallProvider(this._backgroundService): _callHelper= _backgroundService.callHelper;
  SIPUAHelper? get helper => _callHelper;

  bool _registered = false;
  final MyBackgroundService _backgroundService;
  Future<void> register(SessionInfo? sessionInfo) async {
    if (sessionInfo?.callingInfo != null && !_registered) {
      final extConnectInfo = sessionInfo?.callingInfo?.getExtConnectInfo();


      //await _backgroundService.start();
      _backgroundService.registerCall(sessionInfo?.callingInfo?.Token??"");

      final Map<String, String> _wsExtraHeaders = {
        // 'Origin': ' https://tryit.jssip.net',
        // 'Host': 'tryit.jssip.net:10443'
      };
      UaSettings settings = UaSettings();

      //settings.port = _portController.text;
      settings.webSocketSettings.extraHeaders = _wsExtraHeaders;
      settings.webSocketSettings.allowBadCertificate = true;
      //settings.webSocketSettings.userAgent = 'Dart/2.8 (dart:io) for OpenSIPS.';
      settings.tcpSocketSettings.allowBadCertificate = true;
      settings.transportType = TransportType.WS;
      settings.uri =
      '${sessionInfo?.callingInfo?.ExtId}@${extConnectInfo?.ExtDomain}';
      settings.webSocketUrl =
      '${extConnectInfo?.Protocol}://${extConnectInfo?.Server}';
      settings.host = '${extConnectInfo?.ExtDomain}';
      settings.authorizationUser = '${sessionInfo?.callingInfo?.ExtId}';
      settings.password = '${extConnectInfo?.Token}';
      settings.displayName = '${sessionInfo?.callingInfo?.Alias}';
      settings.userAgent = 'Dart SIP Client v1.0.0';
      settings.dtmfMode = DtmfMode.RFC2833;
      settings.contact_uri =
      'sip:${sessionInfo?.callingInfo?.ExtId}@${extConnectInfo?.ExtDomain}';

      Future.delayed(Duration.zero, () {
        helper?.start(settings);
      });
      _registered = true;

      //  helper!.addSipUaHelperListener(this);
    }
  }
//
// @override
// void dispose() {
//   super.dispose();
//
//   if (_registered) helper!.removeSipUaHelperListener(this);
// }
//
// @override
// void callStateChanged(Call call, CallState state) {
//   // TODO: implement callStateChanged
// }
//
// @override
// void onNewMessage(SIPMessageRequest msg) {
//   // TODO: implement onNewMessage
// }
//
// @override
// void onNewNotify(Notify ntf) {
//   // TODO: implement onNewNotify
// }
//
// @override
// void registrationStateChanged(RegistrationState state) {
//   Future.delayed(Duration.zero, notifyListeners);
// }
//
// @override
// void transportStateChanged(TransportState state) {
//   // TODO: implement transportStateChanged
// }
}
