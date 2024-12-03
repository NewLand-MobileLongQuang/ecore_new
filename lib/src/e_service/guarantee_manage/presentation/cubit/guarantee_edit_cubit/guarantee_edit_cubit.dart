import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/upload_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_attach_file_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rq_es_warranty_edit_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_edit.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_by_warranty_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/update.dart';
import 'package:meta/meta.dart';

part 'guarantee_edit_state.dart';

class GuaranteeEditCubit extends Cubit<GuaranteeEditState> {
  GuaranteeEditCubit({
    required GetByWarrantyNoUseCase getByWarrantyNoUseCase,
    required UpdateWarrantyUseCase updateWarrantyUseCase,
    required UploadFileUseCase uploadFileUseCase,
  }): _getByWarrantyNoUseCase = getByWarrantyNoUseCase,
        _updateWarrantyUseCase = updateWarrantyUseCase,
      _uploadFileUseCase = uploadFileUseCase,
      super(GuaranteeEditInitial());

  final GetByWarrantyNoUseCase _getByWarrantyNoUseCase;
  final UpdateWarrantyUseCase _updateWarrantyUseCase;
  final UploadFileUseCase _uploadFileUseCase;

  Future<void> init(String WarrantyNo) async {
    emit(GuaranteeEditLoading());
    try {
      final rt_es_WarrantyDetail = await _getByWarrantyNoUseCase.call(GetByWarrantyNoParams(WarrantyNo: WarrantyNo));
      final rt_es_WarrantyDetailFold = rt_es_WarrantyDetail.fold((l) => null, (r) => r)!;

      emit(
        GuaranteeEditLoaded(
          eS_WarrantyDetail: rt_es_WarrantyDetailFold.Lst_ES_WarrantyDetail[0],
          Lst_ES_WarrantyAttachFile: rt_es_WarrantyDetailFold.Lst_ES_WarrantyAttachFile,
        ),
      );
    } catch (e) {
      emit(GuaranteeEditError(message: e.toString()));
    }
  }

  Future<void> update(
    ES_WarrantyEdit es_WarrantyEdit,
    List<ES_WarrantyAttachFile> lst_ES_WarrantyAttachFile,
    List<File?> listFile,
  ) async {
    final currentState = state as GuaranteeEditLoaded;
    emit(GuaranteeEditLoading());
    if(listFile.isNotEmpty){
      for (final file in listFile) {
        if (file != null) {
          final image = await _uploadFileUseCase.call(UploadFileParams(file: file));
          final imageFold = image.fold((l) => null, (r) => r)!;
          lst_ES_WarrantyAttachFile.add(
              ES_WarrantyAttachFileModel(
                Idx: lst_ES_WarrantyAttachFile.length + 1,
                FileName: imageFold.FileFullName,
                FileSize: imageFold.FileSize.toString(),
                FilePath: imageFold.FileUrlFS,
                FileType: imageFold.FileType,
              )
          );
        }
      }
    }

    // update
    for(ES_WarrantyAttachFile list in lst_ES_WarrantyAttachFile){
      list.Idx = lst_ES_WarrantyAttachFile.indexOf(list) + 1;
    }
    try {
      final objRQ_ES_WarrantyEditModel = RQ_ES_WarrantyEditModel(
          es_WarrantyEdit: es_WarrantyEdit,
          Lst_ES_WarrantyAttachFile: lst_ES_WarrantyAttachFile
      );
      final params = jsonEncode(objRQ_ES_WarrantyEditModel.toJson());
      await _updateWarrantyUseCase.call(UpdateWarrantyParams(strJson: params));
      emit(GuaranteeEditSuccess());
    } catch (e) {
      emit(GuaranteeEditError(message: e.toString()));
      emit(currentState);
    }
  }

  Future<void> fillCustomer(
    ES_WarrantyDetail eS_WarrantyDetail,
    List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile,
    ES_Customer eS_Customer,
  ) async {
    emit(GuaranteeEditLoading());
    try {
      eS_WarrantyDetail
      ..CustomerCodeSys = eS_Customer.CustomerCodeSys
      ..CustomerName = eS_Customer.CustomerName
      ..CustomerPhoneNo = eS_Customer.CustomerPhoneNo
      ..CustomerAddress = eS_Customer.CustomerAddress
      ..CustomerEmail = eS_Customer.CustomerEmail;
      emit(
        GuaranteeEditLoaded(
          eS_WarrantyDetail: eS_WarrantyDetail,
          Lst_ES_WarrantyAttachFile: Lst_ES_WarrantyAttachFile,
        ),
      );
    } catch (e) {
      emit(GuaranteeEditError(message: e.toString()));
    }
  }
}
