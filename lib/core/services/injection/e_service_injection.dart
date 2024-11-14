import 'package:ecore/core/services/injection/injection_container.dart';
import 'package:ecore/src/e_service/customer_manage/data/datasource/es_customer_datasource.dart';
import 'package:ecore/src/e_service/customer_manage/data/datasource/es_upload_file_datasource.dart';
import 'package:ecore/src/e_service/customer_manage/data/repos/es_customer_repo_impl.dart';
import 'package:ecore/src/e_service/customer_manage/data/repos/es_upload_file_repo_impl.dart';
import 'package:ecore/src/e_service/customer_manage/domain/repos/es_customer_repo.dart';
import 'package:ecore/src/e_service/customer_manage/domain/repos/es_upload_file_repo.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/create_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_by_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/search_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/upload_file.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_create_cubit/customer_create_cubit.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_detail_cubit/customer_detail_cubit.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_manage_cubit/customer_manage_cubit.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/datasource/es_warranty_datasource.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/repos/es_warranty_repo_impl.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/create.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/delete.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_by_warranty_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_input_by_serial_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/search.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/update.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_activate_cubit/guarantee_activate_cubit.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_detail_cubit/guarantee_detail_cubit.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_edit_cubit/guarantee_edit_cubit.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_manage_cubit/guarantee_manage_cubit.dart';
import 'package:ecore/src/e_service/repair_history_search/presentation/cubit/repair_history_search_cubit/repair_history_search_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/data/datasource/es_ro_datasource.dart';
import 'package:ecore/src/e_service/repair_manage/data/repos/es_ro_impl.dart';
import 'package:ecore/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/delete.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/finish.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/get_by_ro_no.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/search.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/search_error_component.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/search_error_type.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/search_product.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/update.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_detail_cubit/repair_detail_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_edit_cubit/repair_edit_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_manage_cubit/repair_manage_cubit.dart';

import '../../../src/e_service/index/presentation/cubit/e_service_cubit/e_service_cubit.dart';
import '../../../src/e_service/index/presentation/cubit/image_page_view/image_page_view_cubit.dart';

Future<void> eServiceManageInit() async {
  sl
    ..registerFactory(EServiceCubit.new)
    ..registerFactory(ImagePageViewCubit.new)

  // Khach hang
    ..registerFactory(() => CustomerManageCubit(
        searchCustomerUseCase: sl()))
    ..registerLazySingleton(() => SearchCustomerUseCase(sl()))
    ..registerLazySingleton(() => CreateCustomerUseCase(sl()))
    ..registerLazySingleton(() => GetCustomerCodeSysUseCase(sl()))
    ..registerLazySingleton(() => GetByCustomerCodeSysUseCase(sl()))
    ..registerLazySingleton(() => UploadFileUseCase(sl()))
    ..registerLazySingleton<ES_CustomerRepository>(() => ES_CustomerRepositoryImpl(sl()))
    ..registerLazySingleton<ES_CustomerDataSource>(() => ES_CustomerRemoteDataSource(sl()))
    ..registerLazySingleton<ES_UploadFileRepository>(() => ES_UploadFileRepositoryImpl(sl()))
    ..registerLazySingleton<ES_UploadFileDataSource>(() => ES_UploadFileRemoteDataSource(sl()))


  // Them moi khach hang
    ..registerFactory(() => CustomerCreateCubit(
        createCustomerUseCase: sl(),
        getCustomerCodeSysUseCase: sl()))

  // Thong tin khach hang
    ..registerFactory(() => CustomerDetailCubit(
        getByCustomerCodeSysUseCase: sl()
    ))

  // Quan li bao hanh
    ..registerFactory(() => GuaranteeManageCubit(
        searchWarrantyUseCase: sl(),
        deleteWarrantyUseCase: sl()))
    ..registerLazySingleton(() => DeleteWarrantyUseCase(sl()))
    ..registerLazySingleton(() => GetByWarrantyNoUseCase(sl()))
    ..registerLazySingleton(() => SearchWarrantyUseCase(sl()))
    ..registerLazySingleton(() => UpdateWarrantyUseCase(sl()))
    ..registerLazySingleton<ES_WarrantyRepository>(() => ES_WarrantyRepositoryImpl(sl()))
    ..registerLazySingleton<ES_WarrantyDataSource>(() => ES_WarrantyRemoteDataSource(sl()))

  // Thong tin chi tiet bao hanh
    ..registerFactory(() => GuaranteeDetailCubit(
        getByWarrantyNoUseCase: sl(),
        deleteWarrantyUseCase: sl()))

  // Cap nhat thong tin bao hanh
    ..registerFactory(() => GuaranteeEditCubit(
        getByWarrantyNoUseCase: sl(),
        updateWarrantyUseCase: sl(),
        uploadFileUseCase: sl()))

  //Kich hoat bao hanh
    ..registerFactory(() => GuaranteeActivateCubit(
        getInputBySerialNoUseCase: sl(),
        createWarrantyUseCase: sl(),
        uploadFileUseCase: sl()))

  // Quan li sua chua
    ..registerFactory(() => RepairManageCubit(
        searchROUseCase: sl()))
    ..registerLazySingleton(() => DeleteROUseCase(sl()))
    ..registerLazySingleton(() => GetByRONoUseCase(sl()))
    ..registerLazySingleton(() => SearchROUseCase(sl()))
    ..registerLazySingleton(() => UpdateROUseCase(sl()))
    ..registerLazySingleton(() => SearchErrorTypeUseCase(sl()))
    ..registerLazySingleton(() => SearchProductUseCase(sl()))
    ..registerLazySingleton(() => SearchErrorComponentUseCase(sl()))
    ..registerLazySingleton(() => GetInputBySerialNoUseCase(sl()))
    ..registerLazySingleton(() => CreateWarrantyUseCase(sl()))
    ..registerLazySingleton(() => FinishROUseCase(sl()))
    ..registerLazySingleton<ES_RORepository>(() => ES_RORepositoryImpl(sl()))
    ..registerLazySingleton<ES_RODataSource>(() => ES_RORemoteDataSource(sl()))

  // Chi tiet sua chua
    ..registerFactory(() => RepairDetailCubit(
        getByRONoUseCase: sl(),
        deleteROUseCase: sl()))

  // Cap nhat sua chua
    ..registerFactory(() => RepairEditCubit(
        getByRONoUseCase: sl(),
        updateROUseCase: sl(),
        searchErrorTypeUseCase: sl(),
        searchProductUseCase: sl(),
        searchErrorComponentUseCase: sl(),
        uploadFileUseCase: sl(),
        finishROUseCase: sl()))

    // Tra cuu lich su sua chua
    ..registerFactory(() => RepairHistorySearchCubit(
        searchWarrantyUseCase: sl(),
        searchROUseCase: sl(),
        getInputBySerialNoUseCase: sl()));

  // Khac

}