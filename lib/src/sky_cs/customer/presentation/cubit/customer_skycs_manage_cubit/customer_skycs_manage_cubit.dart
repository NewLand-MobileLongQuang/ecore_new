import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecore/src/sky_cs/customer/data/models/rq_sky_customer_delete_model.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/delete_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/sky_customer_info.dart';

part 'customer_skycs_manage_state.dart';

class CustomerSkyCSManageCubit extends Cubit<CustomerSkyCSManageState> {
  CustomerSkyCSManageCubit({
    required SearchCustomerSkyCSUseCase searchCustomerSkyCSUseCase,
    required DeleteCustomerUseCase deleteCustomerUseCase,
  }) : _searchCustomerSkyCSUseCase = searchCustomerSkyCSUseCase,
        _deleteCustomerUseCase = deleteCustomerUseCase,
        super(CustomerSkyCSManageInitial());

  // API day nhung dung o man nao thi chuyen qua man do, ko thia xoa khoi cubit nay
  final SearchCustomerSkyCSUseCase _searchCustomerSkyCSUseCase;
  final DeleteCustomerUseCase _deleteCustomerUseCase;
  int pageIndex = 0;
  bool loadingMore = true;
  static const int pageSize = 10;

  Future<void> init() async {
    emit(CustomerSkyCSManageLoading());
    try {
      final listCustomer = await _searchCustomerSkyCSUseCase(
        SearchCustomerSkyCSParams(
          ScrTplCodeSys: 'SCRTPLCODESYS.2023',
          KeyWord: '',
          FlagActive: '1',
          Ft_PageIndex: pageIndex.toString(),
          Ft_PageSize: pageSize.toString(),
        ),
      );
      loadingMore = (listCustomer.fold((l) => null, (r) => r)?.length ?? 0) == pageSize;
      ++pageIndex;
      final listCustomerFold = listCustomer.fold((l) => l, (r) => r) as List<SKY_CustomerInfo>;
      emit(CustomerSkyCSManageLoaded(
        listCustomer: listCustomerFold,
        listPress: List.generate(listCustomerFold.length, (index) => false),
      ));
    } catch (e) {
      emit(CustomerSkyCSManageError(e.toString()));
    }
  }

  Future<void> loadMore() async {
    try{
      if(state is CustomerSkyCSManageLoaded && state is! CustomerSkyCSManageLoadingMore && loadingMore) {
        emit(CustomerSkyCSManageLoadingMore(listCustomer: (state as CustomerSkyCSManageLoaded).listCustomer, listPress: (state as CustomerSkyCSManageLoaded).listPress));
        final listLoadMore = await _searchCustomerSkyCSUseCase(
          SearchCustomerSkyCSParams(
            ScrTplCodeSys: 'SCRTPLCODESYS.2023',
            KeyWord: '',
            FlagActive: '1',
            Ft_PageIndex: pageIndex.toString(),
            Ft_PageSize: pageSize.toString(),
          ),
        );
        final listLoadMoreFold = listLoadMore.fold((l) => l, (r) => r) as List<SKY_CustomerInfo>;
        emit(CustomerSkyCSManageLoaded(
          listCustomer: (state as CustomerSkyCSManageLoaded).listCustomer + listLoadMoreFold,
          listPress: (state as CustomerSkyCSManageLoaded).listPress + List.generate(listLoadMoreFold.length, (index) => false),
        ));
        loadingMore = (listLoadMore.fold((l) => null, (r) => r)?.length ?? 0) == pageSize;
        ++pageIndex;
      }
    }
    catch(e) {
      emit(CustomerSkyCSManageError(e.toString()));
    }
  }

  Future<void> search(String query) async {
    pageIndex = 0;
    loadingMore = true;
    emit(CustomerSkyCSManageLoading());
    try{
      final listCustomer = await _searchCustomerSkyCSUseCase(
        SearchCustomerSkyCSParams(
          ScrTplCodeSys: 'SCRTPLCODESYS.2023',
          KeyWord: query,
          FlagActive: '1',
          Ft_PageIndex: pageIndex.toString(),
          Ft_PageSize: pageSize.toString(),
        ),
      );
      final listCustomerFold = listCustomer.fold((l) => l, (r) => r) as List<SKY_CustomerInfo>;
      emit(CustomerSkyCSManageLoaded(
          listCustomer: listCustomerFold,
          listPress: List.generate(listCustomerFold.length, (index) => false)
      ));
      loadingMore = (listCustomer.fold((l) => null, (r) => r)?.length ?? 0) == pageSize;
      ++pageIndex;
    }
    catch (e) {
      emit(CustomerSkyCSManageError(e.toString()));
    }
  }

  Future<void> chooseCustomer(int index) async {
    if(state is CustomerSkyCSManageLoaded) {
      final listPress = (state as CustomerSkyCSManageLoaded).listPress;
      listPress[index] = !listPress[index];
      emit(CustomerSkyCSManageLoaded(
        listCustomer: (state as CustomerSkyCSManageLoaded).listCustomer,
        listPress: listPress,
      ));
    }
  }

  Future<void> deleteCustomer() async {
    final currentState = state as CustomerSkyCSManageLoaded;
    if(state is CustomerSkyCSManageLoaded) {
      final listPress = (state as CustomerSkyCSManageLoaded).listPress;
      final listCustomer = (state as CustomerSkyCSManageLoaded).listCustomer;
      final listCustomerDelete = listCustomer.where((element) => listPress[listCustomer.indexOf(element)]).toList();
      try {
        for (final customer in listCustomerDelete) {
          final rqCustomerDelete = RQ_SKY_CustomerDeleteModel(
            OrgID: customer.OrgID,
            CustomerCodeSys: customer.CustomerCodeSys,
            NetworkID: customer.NetworkID,
          );
          final strJson = jsonEncode(rqCustomerDelete.toJson());
          await _deleteCustomerUseCase(DeleteCustomerParams(strJson: strJson));
        }
        emit(CustomerSkyCSManageDeleteSuccess());
      }
      catch(e) {
        emit(CustomerSkyCSManageError('Xóa khách hàng thất bại'));
        emit(currentState);
      }
    }
  }
}
