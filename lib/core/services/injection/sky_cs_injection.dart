import 'package:ecore/core/services/injection/injection_container.dart';
import 'package:ecore/src/sky_cs/customer/data/datasource/sky_customer_datasource.dart';
import 'package:ecore/src/sky_cs/customer/data/repos/sky_customer_repo_impl.dart';
import 'package:ecore/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/create_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/delete_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_by_customer_code_sys.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_customer_partner_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_customer_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_by_customer_code_sys.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_list_option.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_contact.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_group.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_hist.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_zalo_user.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/change_detail_cubit/change_detail_cubit.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/customer_skycs_create_cubit/customer_skycs_create_cubit.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/customer_skycs_detail_cubit/customer_skycs_detail_cubit.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/customer_skycs_manage_cubit/customer_skycs_manage_cubit.dart';
import 'package:ecore/src/sky_cs/index/presentation/cubit/sky_cs_cubit.dart';

import '../../../src/sky_cs/eticket/data/datasource/sky_eTicket_datasource.dart';
import '../../../src/sky_cs/eticket/data/repos/sky_eticket_repo_impl.dart';
import '../../../src/sky_cs/eticket/domain/repos/sky_eticket_repo.dart';
import '../../../src/sky_cs/eticket/domain/usecases/create_eticket.dart';
import '../../../src/sky_cs/eticket/domain/usecases/get_by_eticket_code_sys.dart';
import '../../../src/sky_cs/eticket/domain/usecases/get_by_eticket_create_masterdata.dart';
import '../../../src/sky_cs/eticket/domain/usecases/merge_eticket.dart';
import '../../../src/sky_cs/eticket/domain/usecases/search_eticket.dart';
import '../../../src/sky_cs/eticket/domain/usecases/search_eticket_grouptpl.dart';
import '../../../src/sky_cs/eticket/domain/usecases/search_ticketID_group.dart';
import '../../../src/sky_cs/eticket/domain/usecases/split_eticket.dart';
import '../../../src/sky_cs/eticket/presentation/cubit/eTicket_create_cubit/eTicket_create_cubit.dart';
import '../../../src/sky_cs/eticket/presentation/cubit/eTicket_detail_cubit/eTicket_detail_cubit.dart';
import '../../../src/sky_cs/eticket/presentation/cubit/eTicket_manage_cubit/eTicket_manage_cubit.dart';

Future<void> skyCSManageInit() async {
  sl
    ..registerFactory(SkyCsCubit.new)

  // Khach hang
    ..registerFactory(() => CustomerSkyCSManageCubit(
      searchCustomerSkyCSUseCase: sl(),
      deleteCustomerUseCase: sl(),
    ))
    ..registerFactory(() => CustomerSkyCSDetailCubit(
      getByCustomerCodeSysUseCase: sl(),
      getAllByCustomerCodeSysUseCase: sl(),
    ))
    ..registerFactory(() => CustomerSkyCSCreateCubit(
      searchCustomerGroupUseCase: sl(),
      searchCustomerColumnUseCase: sl(),
      getListOptionUseCase: sl(),
      getCustomerCodeSysUseCase: sl(),
      createCustomerSkyCSUseCase: sl(),
      getAllCustomerTypeUseCase: sl(),
      getAllCustomerPartnerTypeUseCase: sl(),
      searchZaloUserUseCase: sl(),
    ))

    ..registerLazySingleton(() => SearchCustomerGroupUseCase(sl()))
    ..registerLazySingleton(() => SearchCustomerColumnUseCase(sl()))
    ..registerLazySingleton(() => GetListOptionUseCase(sl()))
    ..registerLazySingleton(() => CreateCustomerSkyCSUseCase(sl()))
    ..registerLazySingleton(() => GetAllCustomerTypeUseCase(sl()))
    ..registerLazySingleton(() => GetAllCustomerPartnerTypeUseCase(sl()))
    ..registerLazySingleton(() => SearchZaloUserUseCase(sl()))

    ..registerLazySingleton(() => SearchCustomerSkyCSUseCase(sl()))
    ..registerLazySingleton(() => GetByCustomerCodeSysUseCase(sl()))
    ..registerLazySingleton(() => SearchCustomerHistUseCase(sl()))
    ..registerLazySingleton(() => SearchCustomerContactUseCase(sl()))
    ..registerLazySingleton(() => GetAllByCustomerCodeSysUseCase(sl()))
    ..registerLazySingleton(() => DeleteCustomerUseCase(sl()))
    ..registerLazySingleton<SKY_CustomerRepository>(() => SKY_CustomerRepositoryImpl(sl()))
    ..registerLazySingleton<SKY_CustomerDataSource>(() => SKY_CustomerRemoteDataSource(sl()))

    ..registerFactory(ChangeDetailCubit.new)


  //eTicket
  ..registerLazySingleton<SKY_EticketDataSource>(() => SKY_eTicketRemoteDataSource(sl()))
  ..registerLazySingleton<SKY_EticketRepository>(() => SKY_EticketRepositoryImpl(sl()))
  ..registerLazySingleton(() => GetByEticketCodeSysUseCase(sl()))
  ..registerLazySingleton(() => SearchETicketSkyCSUseCase(sl()))
  ..registerLazySingleton(() => SearchTicketIDGroupUseCase(sl()))
  ..registerLazySingleton(() => SearchTicketTplGroupUseCase(sl()))
  ..registerLazySingleton(() => GetMstTagsUseCase(sl()))
  ..registerLazySingleton(() => GetMstOrgUseCase(sl()))
  ..registerLazySingleton(() => GetTicketPriorityUseCase(sl()))
  ..registerLazySingleton(() => GetTicketSourceUseCase(sl()))
  ..registerLazySingleton(() => GetTicketStatusUseCase(sl()))
  ..registerLazySingleton(() => GetReceptionChannelUseCase(sl()))
  ..registerLazySingleton(() => GetLstDepartmentUseCase(sl()))
  ..registerLazySingleton(() => GetAgentUseCase(sl()))
  ..registerLazySingleton(() => GetTicketTypeUseCase(sl()))
  ..registerLazySingleton(() => GetCustomTypeUseCase(sl()))
  ..registerLazySingleton(() => CreateETicketSkyCSUseCase(sl()))
  ..registerLazySingleton(() => MergeETicketSkyCSUseCase(sl()))
  ..registerLazySingleton(() => SplitETicketSkyCSUseCase(sl()))

  ..registerFactory(() => eTicketManageCubit(
    searchEticketSkyCSUseCase: sl(),
    mergeEticketSkyCSUseCase: sl())
  )
  ..registerFactory(() => eTicketDetailCubit(
    getByETIDUseCase: sl(),
    splitETIDUseCase: sl())
  )
  ..registerFactory(() => eTicketCreateCubit(
    getByETGetByETScrTplCodeSys: sl(),
    getETtpl: sl(),
    getETMstTags: sl(),
    getETMstOrgUseCase: sl(),
    getETTicketPriority: sl(),
    getETTicketSource: sl(),
    getETTicketStatus: sl(),
    getETReceptionChannel: sl(),
    getETLstDepartment: sl(),
    getETAgent: sl(),
    getETicketType: sl(),
    getETCustomType: sl(), createETicketSkyCSUseCase: sl(),
    searchCustomerSkyCSUseCase: sl(),
  ));

}