import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/index/presentation/cubit/e_service_cubit/e_service_cubit.dart';
import 'package:ecore/src/e_service/index/presentation/views/e_service_screen.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_manage_cubit/repair_manage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecore/core/services/injection/injection_container.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_create_cubit/customer_create_cubit.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_detail_cubit/customer_detail_cubit.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_manage_cubit/customer_manage_cubit.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/views/customer_create_screen.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/views/customer_detail_screen.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/views/customer_manage_screen.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_activate_cubit/guarantee_activate_cubit.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_detail_cubit/guarantee_detail_cubit.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_edit_cubit/guarantee_edit_cubit.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_manage_cubit/guarantee_manage_cubit.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_activate_screen.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_detail_screen.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_edit_screen.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_manage_screen.dart';
import 'package:ecore/src/e_service/repair_history_search/presentation/cubit/repair_history_search_cubit/repair_history_search_cubit.dart';
import 'package:ecore/src/e_service/repair_history_search/presentation/views/repair_history_search_screen.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_detail_cubit/repair_detail_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_edit_cubit/repair_edit_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/views/repair_detail_screen.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/views/repair_edit_screen.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/views/repair_manage_screen.dart';

import 'router.dart';

PageRouteBuilder? handleCaseEService(RouteSettings settings) {
  if (!settings.name!.startsWith(EServiceUtils.kSolutionCode)) return null;

  final path = settings.name?.split('/').lastOrNull;

  if (path == null) return null;

  switch (path) {
    case EServiceScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<EServiceCubit>(), child: const EServiceScreen()), settings: settings);

    case GuaranteeManageScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<GuaranteeManageCubit>(), child: const GuaranteeManageScreen()), settings: settings);

    case GuaranteeDetailScreen.routeName:
      final id = settings.arguments as String;
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<GuaranteeDetailCubit>(), child: GuaranteeDetailScreen(id: id)), settings: settings);

    case GuaranteeEditScreen.routeName:
      final id = settings.arguments as String;
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<GuaranteeEditCubit>(), child: GuaranteeEditScreen(id: id)), settings: settings);

    case GuaranteeActivateScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<GuaranteeActivateCubit>(), child: const GuaranteeActivateScreen()), settings: settings);

    case CustomerManageScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<CustomerManageCubit>(), child: const CustomerManageScreen()), settings: settings);

    case CustomerCreateScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<CustomerCreateCubit>(), child: const CustomerCreateScreen()), settings: settings);

    case CustomerDetailScreen.routeName:
      final customerCodeSys = settings.arguments as String;
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<CustomerDetailCubit>(), child: CustomerDetailScreen(customerCodeSys: customerCodeSys)), settings: settings);

    case RepairManageScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<RepairManageCubit>(), child: const RepairManageScreen()), settings: settings);

    case RepairDetailScreen.routeName:
      final id = settings.arguments as String;
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<RepairDetailCubit>(), child: RepairDetailScreen(id: id)), settings: settings);

    case RepairEditScreen.routeName:
      final id = settings.arguments as String;
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<RepairEditCubit>(), child: RepairEditScreen(id: id)), settings: settings);

    case RepairHistorySearchScreen.routeName:
      return pageBuilder((p0) => BlocProvider(create: (_) => sl<RepairHistorySearchCubit>(), child: const RepairHistorySearchScreen()), settings: settings);

    default:
      return null;
  }
}
