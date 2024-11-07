import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/delete.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_by_warranty_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rq_es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';

import 'package:meta/meta.dart';

part 'guarantee_detail_state.dart';

class GuaranteeDetailCubit extends Cubit<GuaranteeDetailState> {
  GuaranteeDetailCubit(
    {required GetByWarrantyNoUseCase getByWarrantyNoUseCase,
    required DeleteWarrantyUseCase deleteWarrantyUseCase,}
    ):_getByWarrantyNoUseCase = getByWarrantyNoUseCase,
      _deleteWarrantyUseCase = deleteWarrantyUseCase,
    super(GuaranteeDetailInitial());

  final GetByWarrantyNoUseCase _getByWarrantyNoUseCase;
  final DeleteWarrantyUseCase _deleteWarrantyUseCase;

  Future<void> init(String WarrantyNo) async {
    emit(GuaranteeDetailLoading());
    try {
      final rt_es_WarrantyDetail = await _getByWarrantyNoUseCase.call(GetByWarrantyNoParams(WarrantyNo: WarrantyNo));
      final rt_es_WarrantyDetailFold = rt_es_WarrantyDetail.fold((l) => null, (r) => r)!;
      emit(GuaranteeDetailLoaded(
        eS_WarrantyDetail: rt_es_WarrantyDetailFold.Lst_ES_WarrantyDetail[0],
        Lst_ES_WarrantyAttachFile: rt_es_WarrantyDetailFold.Lst_ES_WarrantyAttachFile,
      ));
    } catch (e) {
      emit(GuaranteeDetailError(message: e.toString()));
    }
  }

  Future<void> delete(ES_WarrantyDeleteModel es_WarrantyDeleteModel,) async {
    try {
      final objRQ_ES_WarrantyDeleteModel = RQ_ES_WarrantyDeleteModel(
          es_WarrantyDelete: es_WarrantyDeleteModel,
      );
      final params = jsonEncode(objRQ_ES_WarrantyDeleteModel.toJson());

      await _deleteWarrantyUseCase.call(DeleteWarrantyParams(strJson: params));
      emit(GuaranteeDetailDeleteSuccess());
    } catch (e) {
      emit(GuaranteeDetailError(message: e.toString()));
    }
  }
}
