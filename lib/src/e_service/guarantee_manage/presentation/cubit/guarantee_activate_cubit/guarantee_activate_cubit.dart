import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_for_current_user.dart';

import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_attach_file_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/rq_es_warranty_create_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_create.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_install.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/create.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_input_by_serial_no.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/upload_file.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/modules/auth/domain/entities/session_info.dart';
part 'guarantee_activate_state.dart';

class GuaranteeActivateCubit extends Cubit<GuaranteeActivateState> {
  GuaranteeActivateCubit({
    required GetInputBySerialNoUseCase getInputBySerialNoUseCase,
    required CreateWarrantyUseCase createWarrantyUseCase,
    required UploadFileUseCase uploadFileUseCase,
    required GetForCurrentUser getForCurrentUser,
  }): _getInputBySerialNoUseCase = getInputBySerialNoUseCase,
        _createWarrantyUseCase = createWarrantyUseCase,
        _uploadFileUseCase = uploadFileUseCase,
        _getForCurrentUser = getForCurrentUser,
        super(GuaranteeActivateInitial());

  final GetInputBySerialNoUseCase _getInputBySerialNoUseCase;
  final CreateWarrantyUseCase _createWarrantyUseCase;
  final UploadFileUseCase _uploadFileUseCase;
  final ss = SessionInfo.current().user;
  final GetForCurrentUser _getForCurrentUser;
  int productExpiry = 0;

  Future<void> init () async {
    emit(GuaranteeActivateLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final qrInfo = RT_ES_WarrrantyActivateByQR(
        SerialNo: '',
        ProductCode: '',
        ProductCodeUser: '',
        ProductName: '',
        ProductionDTimeUTC: '',
        FactoryCode: '',
        KCS: '',
        ProductExpiry: '',
      );
      final customer = ES_Customer(
          CustomerCodeSys: '',
          CustomerCode: '',
          CustomerName: '',
          CustomerPhoneNo: '',
          CustomerEmail: '',
          CustomerAddress: '',
          CustomerAvatarPath: '',
      );

      final cUser = await _getForCurrentUser();
      final cUserFold = cUser.fold((l) => null, (r) => r);

      final install = ES_WarrantyInstall(
        name: cUserFold?.UserName??'',
        installDate: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        installTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        expiredDate: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        note: '',
      );

      emit(
        GuaranteeActivateLoaded(
          rT_ES_WarrrantyActivateByQR: qrInfo,
          eS_Customer: customer,
          eS_WarrantyInstall: install,
        ),
      );
    } catch (e) {
      emit(GuaranteeActivateError(e.toString()));
    }
  }

  Future<void> scanQrCode(
      String qrCode,
      ES_Customer eS_Customer,
      ES_WarrantyInstall eS_WarrantyInstall,
  ) async {
    emit(GuaranteeActivateLoading());
    try {
      final scanner = await _getInputBySerialNoUseCase.call(GetInputBySerialNoParams(SerialNo: qrCode));
      final scannerFold = scanner.fold((l) => null, (r) => r)!;
      if(scannerFold[0].ProductExpiry != ''){
        productExpiry = int.parse(scannerFold[0].ProductExpiry);
        eS_WarrantyInstall.expiredDate = StringGenerate.addMonths(eS_WarrantyInstall.installTime, productExpiry);
      }
      emit(
        GuaranteeActivateLoaded(
          rT_ES_WarrrantyActivateByQR: scannerFold[0],
          eS_Customer: eS_Customer,
          eS_WarrantyInstall: eS_WarrantyInstall,
        ),
      );
    } catch (e) {
      emit(GuaranteeActivateError(e.toString()));
    }
  }

  Future<void> fillCustomer(
    RT_ES_WarrrantyActivateByQR rT_ES_WarrrantyActivateByQR,
    ES_Customer eS_Customer,
    ES_WarrantyInstall eS_WarrantyInstall,
  ) async {
    emit(GuaranteeActivateLoading());
    try {
      emit(
        GuaranteeActivateLoaded(
          rT_ES_WarrrantyActivateByQR: rT_ES_WarrrantyActivateByQR,
          eS_Customer: eS_Customer,
          eS_WarrantyInstall: eS_WarrantyInstall,
        ),
      );
    } catch (e) {
      emit(GuaranteeActivateError(e.toString()));
    }
  }

  Future<void> chooseDateAndTime(
      RT_ES_WarrrantyActivateByQR rT_ES_WarrrantyActivateByQR,
      ES_Customer eS_Customer,
      ES_WarrantyInstall eS_WarrantyInstall,
      String time,
      ) async {
    emit(GuaranteeActivateLoading());
    try {
      eS_WarrantyInstall
        ..installTime = time
        ..expiredDate = StringGenerate.addMonths(time, productExpiry);
      emit(
        GuaranteeActivateLoaded(
          rT_ES_WarrrantyActivateByQR: rT_ES_WarrrantyActivateByQR,
          eS_Customer: eS_Customer,
          eS_WarrantyInstall: eS_WarrantyInstall,
        ),
      );
    } catch (e) {
      emit(GuaranteeActivateError(e.toString()));
    }
  }

  Future<void> create(
      ES_WarrantyCreate es_WarrantyCreate,
      List<File?> files,
  ) async{
    final currentState = state;
    emit(GuaranteeActivateLoading());
    List<ES_WarrantyAttachFile> lst_ES_WarrantyAttachFile = [];
    for (final file in files) {
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
    for(final list in lst_ES_WarrantyAttachFile){
      list.Idx = lst_ES_WarrantyAttachFile.indexOf(list) + 1;
    }
    try {
      final objRQ_ES_WarrantyCreateModel = RQ_ES_WarrantyCreateModel(
          es_WarrantyCreate: es_WarrantyCreate,
          Lst_ES_WarrantyAttachFile: lst_ES_WarrantyAttachFile
      );
      final params = jsonEncode(objRQ_ES_WarrantyCreateModel.toJson());

      await _createWarrantyUseCase.call(CreateWarrantyParams(strJson: params));
      emit(GuaranteeActivateSuccess());
    } catch (e) {
      emit(GuaranteeActivateError(e.toString()));
      emit(currentState);
    }
  }
}
