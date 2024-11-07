import 'package:ecore/src/account/presentation/cubit/init_session_cubit.dart';
import 'package:ecore/src/account/presentation/views/init_session_screen.dart';
import 'package:ecore/src/call/presentation/cubit/call_history_cubit.dart';
import 'package:ecore/src/call/presentation/cubit/call_register_cubit.dart';
import 'package:ecore/src/call/presentation/cubit/dialpad_cubit.dart';
import 'package:ecore/src/call/presentation/views/call_history_screen.dart';
import 'package:ecore/src/call/presentation/views/call_register_screen.dart';
import 'package:ecore/src/call/presentation/views/forward_screen.dart';
import 'package:ecore/src/call/presentation/views/incall_screen.dart';
import 'package:sip_ua/sip_ua.dart';



import '../../../src/account/presentation/cubit/auth_cubit.dart';
import '../../../src/account/presentation/views/login_screen.dart';
import '../../../src/account/presentation/views/select_network_screen.dart';
import '../../../src/call/presentation/views/call_screen.dart';
import '../../../src/dashboard/presentation/views/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';
import '../router.dart';


PageRouteBuilder? handleCaseCommon(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<InitSessionCubit>(), child: const InitSessionScreen()),
          settings: settings);

      // final session = SessionInfo.current();
      //
      // return pageBuilder((context) {
      //   if (session.isAuthenticated()) {
      //     context.sessionProvider.initSession(session);
      //
      //     //if (session.org != null) return const Dashboard();
      //
      //     if (session.org != null) {
      //       // return BlocProvider(
      //       //     create: (_) => sl<SkyCsCubit>(),
      //       //     child: const SkyCsScreen());
      //
      //       return BlocProvider(
      //           create: (_) => sl<DialpadCubit>(), child: const CallScreen());
      //     } else
      //       return BlocProvider(
      //           create: (_) => sl<AuthCubit>(),
      //           child: const SelectNetworkScreen());
      //   }
      //
      //   return BlocProvider(
      //       create: (_) => sl<AuthCubit>(), child: const LoginScreen());
      // }, settings: settings);

    case CallRegisterScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CallRegisterCubit>(), child: CallRegisterScreen()),
          settings: settings);

    case CallHistoryScreen.routeName:
      return pageBuilder((p0) => const CallHistoryScreen(), settings: settings);

    case CallForwardScreen.routeName:
      return pageBuilder((p0) => const CallForwardScreen(), settings: settings);

    case CallScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<DialpadCubit>(), child: const CallScreen()),
          settings: settings);
    case IncallScreen.routeName:
      return pageBuilder((p0) => IncallScreen(settings.arguments as Call?), settings: settings);
  // return pageBuilder(
  //         (p0) => BlocProvider(
  //         create: (_) => sl<DialpadCubit>(), child: IncallScreen(settings.arguments as Call?)),
  //     settings: settings);
    case LoginScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<AuthCubit>(), child: const LoginScreen()),
          settings: settings);
    case Dashboard.routeName:
      return pageBuilder((p0) => const Dashboard(), settings: settings);
    case SelectNetworkScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<AuthCubit>(),
              child: const SelectNetworkScreen()),
          settings: settings);

    default:
      return null;
  }
}


