import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_delete_model.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/rq_es_ro_delete_model.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_attach_file.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_component.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/delete.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/get_by_ro_no.dart';
import 'package:meta/meta.dart';

part 'repair_detail_state.dart';

class RepairDetailCubit extends Cubit<RepairDetailState> {
  RepairDetailCubit({
    required GetByRONoUseCase getByRONoUseCase,
    required DeleteROUseCase deleteROUseCase,
  }) : _getByRONoUseCase = getByRONoUseCase,
        _deleteROUseCase = deleteROUseCase,
        super(RepairDetailInitial());

  final GetByRONoUseCase _getByRONoUseCase;
  final DeleteROUseCase _deleteROUseCase;

  Future<void> init(String RONo) async {
    emit(RepairDetailLoading());
    try {
      final rt_es_RODetail = await _getByRONoUseCase.call(GetByRONoParams(RONo: RONo));
      final rt_es_RODetaillFold = rt_es_RODetail.fold((l) => null, (r) => r)!;

      emit(RepairDetailLoaded(
        eS_RODetail: rt_es_RODetaillFold.Lst_ES_RODetail.first,
        Lst_ES_ROAttachFile: rt_es_RODetaillFold.Lst_ES_ROAttachFile,
        Lst_ES_ROComponent: rt_es_RODetaillFold.Lst_ES_ROComponent,
      ));
    } catch (e) {
      emit(RepairDetailError(message: e.toString()));
    }
  }

  Future<void> delete(ES_RODeleteModel es_RODeleteModel,) async {
    try {
      final objRQ_ES_RODeleteModel = RQ_ES_RODeleteModel(
        es_RODelete: es_RODeleteModel,
      );
      String params = jsonEncode(objRQ_ES_RODeleteModel.toJson());

      await _deleteROUseCase.call(DeleteROParams(strJson: params));
      emit(RepairDetailDeleteSuccess());
    } catch (e) {
      emit(RepairDetailError(message: e.toString()));
    }
  }
}
