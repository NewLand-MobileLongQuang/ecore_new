import 'package:ecore/core/services/injection/injection_container.dart';
import 'package:ecore/core/services/router/router.dart';
import 'package:ecore/src/sky_cs/common/utils.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/customer_skycs_create_cubit/customer_skycs_create_cubit.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/customer_skycs_detail_cubit/customer_skycs_detail_cubit.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/customer_skycs_manage_cubit/customer_skycs_manage_cubit.dart';
import 'package:ecore/src/sky_cs/customer/presentation/views/customer_skycs_create_screen.dart';
import 'package:ecore/src/sky_cs/customer/presentation/views/customer_skycs_detail_screen.dart';
import 'package:ecore/src/sky_cs/customer/presentation/views/customer_skycs_manage_screen.dart';
import 'package:ecore/src/sky_cs/index/presentation/cubit/sky_cs_cubit.dart';
import 'package:ecore/src/sky_cs/index/presentation/view/sky_cs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/sky_cs/eticket/presentation/views/eTicket_manage_screen.dart';

PageRouteBuilder? handleCaseSkyCS(RouteSettings settings) {
  if (!settings.name!.startsWith(SkyCsUtils.kSolutionCode)) return null;

  final path = settings.name?.split('/').lastOrNull;

  if (path == null) return null;

  switch(path){
    case SkyCsScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<SkyCsCubit>(), child: const SkyCsScreen()), settings: settings);

    case CustomerSkyCSManageScreen.routeName:
      return pageBuilder((p0) => const CustomerSkyCSManageScreen(), settings: settings);

    case CustomerSkyCSCreateScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<CustomerSkyCSCreateCubit>(), child: const CustomerSkyCSCreateScreen()), settings: settings);

    case CustomerSkyCSDetailScreen.routeName:
      final args = settings.arguments as Map<String, dynamic>?;
      final CustomerCodeSys = args?['CustomerCodeSys'] as String;
      return pageBuilder(
            (p0) => BlocProvider(
          create: (_) => sl<CustomerSkyCSDetailCubit>(),
          child: CustomerSkyCSDetailScreen(customerCodeSys: CustomerCodeSys,),
        ),
        settings: settings,
      );
    case ETicketManageScreen.routeName:
      return pageBuilder((p0) => const ETicketManageScreen(), settings: settings);
    default:
      return null;
  }
}