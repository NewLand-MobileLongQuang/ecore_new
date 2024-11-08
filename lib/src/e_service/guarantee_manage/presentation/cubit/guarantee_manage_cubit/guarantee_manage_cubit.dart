import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rq_es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/delete.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/search.dart';
import 'package:meta/meta.dart';

part 'guarantee_manage_state.dart';

class GuaranteeManageCubit extends Cubit<GuaranteeManageState> {
  GuaranteeManageCubit({
    required SearchWarrantyUseCase searchWarrantyUseCase,
    required DeleteWarrantyUseCase deleteWarrantyUseCase,})
      : _searchWarrantyUseCase = searchWarrantyUseCase,
        _deleteWarrantyUseCase = deleteWarrantyUseCase,
        super(GuaranteeManageInitial());

  final SearchWarrantyUseCase _searchWarrantyUseCase;
  final DeleteWarrantyUseCase _deleteWarrantyUseCase;

  List<ES_WarrantyDetail>? listDetail;

  Future<void> init() async {
    emit(GuaranteeManageLoading());
    try {
      final list = await _searchWarrantyUseCase.call(
        const SearchWarrantyParams(
          SerialNo: '',
          ProductCode: '',
          CustomerPhoneNo: '',
          CustomerAddress: '',
          AgentCode: '',
          InstallationDTimeUTCFrom: '',
          InstallationDTimeUTCTo: '',
          WarrantyDTimeUTCFrom: '',
          WarrantyDTimeUTCTo: '',
          WarrantyExpDTimeUTCFrom: '',
          WarrantyExpDTimeUTCTo: '',
          Remark: '',
          OrgID: '',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      listDetail = list.fold((l) => null, (r) => r);
      emit(GuaranteeManageLoaded(list: listDetail ?? []));
    } catch (e) {
      emit(GuaranteeManageError(e.toString()));
    }
  }

  Future<void> search(String query) async {
    if(query.isEmpty) {
      emit(GuaranteeManageLoaded(list: listDetail ?? []));
      return;
    }
    final listSearch = listDetail?.where((element) {
      return element.SerialNo.contains(query)
             || element.ProductCode.contains(query)
             || element.CustomerName.contains(query);
    }).toList();
    emit(GuaranteeManageLoaded(list: listSearch ?? []));
  }

  Future<void> delete(ES_WarrantyDeleteModel es_WarrantyDelete,) async {
    try {
      final objRQ_ES_WarrantyDeleteModel = RQ_ES_WarrantyDeleteModel(
        es_WarrantyDelete: es_WarrantyDelete,
      );
      final params = jsonEncode(objRQ_ES_WarrantyDeleteModel.toJson());

      await _deleteWarrantyUseCase.call(DeleteWarrantyParams(strJson: params));
      emit(GuaranteeManageDeleteSuccess());
    } catch (e) {
      emit(GuaranteeManageError(e.toString()));
    }
  }
}
