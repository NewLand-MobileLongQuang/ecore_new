import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rq_es_customer_model.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rq_es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/create_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_customer_code_sys.dart';
import 'package:meta/meta.dart';

part 'customer_create_state.dart';

class CustomerCreateCubit extends Cubit<CustomerCreateState> {
  CustomerCreateCubit({
    required CreateCustomerUseCase createCustomerUseCase,
    required GetCustomerCodeSysUseCase getCustomerCodeSysUseCase,
  }) : _createCustomerUseCase = createCustomerUseCase,
        _getCustomerCodeSysUseCase = getCustomerCodeSysUseCase,
        super(CustomerCreateInitial());

  final CreateCustomerUseCase _createCustomerUseCase;
  final GetCustomerCodeSysUseCase _getCustomerCodeSysUseCase;

  Future<void> init() async {
    emit(CustomerCreateLoading());
    try {
      final result = await _getCustomerCodeSysUseCase.call(GetCustomerCodeSysParams());
      final resultFold = result.fold((l) => null, (r) => r)!;
      emit(CustomerCreateLoaded(customerCodeSys: resultFold));
    }
    catch (e) {
      emit(CustomerCreateError(e.toString()));
    }
  }

  Future<void> create(RQ_ES_CustomerModel customer) async {
    emit(CustomerCreateLoading());
    try {
      final params = jsonEncode(customer.toJson());
      final result = await _createCustomerUseCase.call(CreateCustomerParams(strJson: params));
      final resultFold = result.fold((l) => null, (r) => r)!;
      emit(CustomerCreateSuccess(customer: resultFold));
    }
    catch (e) {
      emit(CustomerCreateError(e.toString()));
    }
  }
}
