import 'package:bloc/bloc.dart';
import 'package:ecore/core/configs/app_config.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/search_customer.dart';
import 'package:meta/meta.dart';

part 'customer_manage_state.dart';

class CustomerManageCubit extends Cubit<CustomerManageState> {
  CustomerManageCubit({
    required SearchCustomerUseCase searchCustomerUseCase,
  }) : _searchCustomerUseCase = searchCustomerUseCase,
    super(CustomerManageInitial());

  final SearchCustomerUseCase _searchCustomerUseCase;

  Future<void> init() async {
    emit(CustomerManageLoading());
    try {
      final result = await _searchCustomerUseCase(
        SearchCustomerParams(
          KeyWord: '',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final resultFolder = result.fold((l) => null, (r) => r)!;
      emit(CustomerManageLoaded(listCustomer: resultFolder));
    } catch (e) {
      emit(CustomerManageError(e.toString()));
    }
  }

  Future<void> search(String params) async {
    emit(CustomerManageLoading());
    try {
      final result = await _searchCustomerUseCase(
        SearchCustomerParams(
          KeyWord: params,
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final resultFolder = result.fold((l) => null, (r) => r)!;
      emit(CustomerManageLoaded(listCustomer: resultFolder));
    } catch (e) {
      emit(CustomerManageError(e.toString()));
    }
  }

  Future<void>  chooseCustomer(ES_Customer customer) async {
    emit(CustomerManageGetSuccess(customer: customer));
  }
}
