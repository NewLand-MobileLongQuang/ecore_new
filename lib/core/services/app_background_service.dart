import 'dart:async';

import 'dart:ui';


import 'package:ecore/core/modules/auth/domain/usecases/load_session_info.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/signalr_service.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sip_ua/sip_ua.dart';

import 'injection_container.dart';
import 'local_notification_service.dart';
//import 'package:wakelock_plus/wakelock_plus.dart';

class MyBackgroundService implements SipUaHelperListener
{
  static const notificationId = 888;
  static const notificationChannelId = 'my_foreground';

  static final SignalRService _signalRService= SignalRService();

  static final MyBackgroundService _instance =
  MyBackgroundService._internal();

  MyBackgroundService._internal(){


  }

  factory MyBackgroundService() => _instance;

  late SIPUAHelper? callHelper;

  Future<void> initializeService(SIPUAHelper? cHelper) async {

    bool shouldStart=true;
    // LoadSessionInfo loadSessionInfo= sl<LoadSessionInfo>();
    // var ssInfo= await loadSessionInfo();
    //
    //
    // ssInfo.fold((l) => null, (sessionInfo) => (){
    //   if(sessionInfo!=null && sessionInfo.org!=null)
    //     {
    //
    //       shouldStart=true;
    //
    //     }
    //
    // });




    callHelper=cHelper;


    final PermissionStatus permissionStatus = await Permission.ignoreBatteryOptimizations.request();

    if(!permissionStatus.isGranted) shouldStart=false;
    //
    // /// OPTIONAL, using custom notification channel id
    // const AndroidNotificationChannel channel = AndroidNotificationChannel(
    //   'my_foreground', // id
    //   'MY FOREGROUND SERVICE', // title
    //   description:
    //   'This channel is used for important notifications.', // description
    //   importance: Importance.low, // importance must be at low or higher level
    // );

    // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    // FlutterLocalNotificationsPlugin();
    //
    // await flutterLocalNotificationsPlugin.initialize(
    //   const InitializationSettings(
    //     iOS: DarwinInitializationSettings(),
    //     android: AndroidInitializationSettings('ic_bg_service_small'),
    //   ),
    // );
    //
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //     AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(channel);

    if(shouldStart) {
      final service = FlutterBackgroundService();
      await service.configure(
        androidConfiguration: AndroidConfiguration(
          // this will be executed when app is in foreground or background in separated isolate
          onStart: onStart,

          // auto start service
          autoStart: true,
          isForegroundMode: false,

          notificationChannelId: 'my_foreground',
          initialNotificationTitle: 'AWESOME SERVICE',
          initialNotificationContent: 'Initializing',
          foregroundServiceNotificationId: notificationId,
          foregroundServiceTypes: [AndroidForegroundType.location],
        ),
        iosConfiguration: IosConfiguration(
          // auto start service
          autoStart: false,

          // this will be executed when app is in foreground in separated isolate
          onForeground: onStart,


          // you have to enable background fetch capability on xcode project
          //onBackground: onIosBackground,
        ),
      );
    }
    callHelper?.addSipUaHelperListener(this);

  }


  @pragma('vm:entry-point')
  static Future<void> onStart(ServiceInstance service) async {
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    _signalRService.openHubConnection();

    // int count=0;
    // // bring to foreground
    // final timer= Timer.periodic(const Duration(seconds: 3), (_timer) async {
    //
    //
    //   // if (service is AndroidServiceInstance) {
    //   //   if (await service.isForegroundService()) {
    //   //     flutterLocalNotificationsPlugin.show(
    //   //       notificationId,
    //   //       'ECORE SERVICE',
    //   //       //'${DateTime.now()}',
    //   //       '${count++}',
    //   //       const NotificationDetails(
    //   //         android: AndroidNotificationDetails(
    //   //           notificationChannelId,
    //   //           'MY FOREGROUND SERVICE',
    //   //           icon: 'ic_bg_service_small',
    //   //           ongoing: true,
    //   //         ),
    //   //       ),
    //   //     );
    //   //   }
    //   // }
    //
    //
    //   LocalNotificationService().newNotification(
    //       message: 'Ecore background', detail: 'Service started');
    //   //WakelockPlus.enable();
    //
    //   //if(count++==300) service.stopSelf();
    // });


    service.on("stop").listen((event) {

      LocalNotificationService().newNotification(
          message: 'Ecore background', detail: 'Service stopped');


      service.stopSelf();


    });

    service.on("registerCall").listen((event) {
      // LocalNotificationService().newNotification(
      //     message: 'Ecore background', detail: 'registerCall');


      //service.stopSelf();
      //print(event);
    });
  }

  void registerCall(String data)
  {
    FlutterBackgroundService().invoke("registerCall");
  }


  // Future<void> start() async
  // {
  //   await FlutterBackgroundService().startService();
  // }

  void stop()
  {
    FlutterBackgroundService().invoke("stop");
  }


  @override
  void callStateChanged(Call call, CallState state) {
    // TODO: implement callStateChanged
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    // TODO: implement onNewMessage
  }

  @override
  void onNewNotify(Notify ntf) {
    // TODO: implement onNewNotify
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    // TODO: implement registrationStateChanged
  }

  @override
  void transportStateChanged(TransportState state) {
    // TODO: implement transportStateChanged
  }


}