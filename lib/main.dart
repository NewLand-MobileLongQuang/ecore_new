import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:ecore/core/services/app_background_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:sip_ua/sip_ua.dart';


import 'core/common/widgets/restart_widget.dart';
import 'core/providers/call_provider.dart';
import 'core/providers/session_provider.dart';
import 'package:ecore/src/dashboard/presentation/providers/dashboard_controller.dart';
import 'core/configs/app_config.dart';
import 'core/res/colors.dart';
import 'core/res/fonts.dart';
import 'core/services/injection_container.dart';
import 'core/services/router.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

SIPUAHelper? _callHelper = SIPUAHelper();
MyBackgroundService _backgroundService= MyBackgroundService();


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  await init(AppEnviroments.development);
  //await init(AppEnviroments.production);


  await _backgroundService.initializeService(_callHelper);


  runApp(
      RestartWidget(
        child: const MyApp(),
      ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp>  with WidgetsBindingObserver { // (1) Use this mixin

  late AppLifecycleState _lastLifecycleState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {


    setState(() {
      _lastLifecycleState = state;
    });

    if(state== AppLifecycleState.detached)
      //if(state== AppLifecycleState.paused)
    {
     // stopBackgroundService();
      MyBackgroundService().stop();
    }
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //startBackgroundService();
  }





  @override
  void dispose() {

    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionProvider()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
        ChangeNotifierProvider(create: (_) => CallProvider(_backgroundService))
      ],
      child: MaterialApp(
        title: 'Ecore',
        theme: ThemeData(
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: AppFonts.interFont,
            appBarTheme: const AppBarTheme(
              color: AppColors.primaryColor,
            ),
            colorScheme:
            ColorScheme.fromSwatch(accentColor: AppColors.primaryColor)),
        onGenerateRoute: generateRoute,
      ),
    );
  }

// ...
}
