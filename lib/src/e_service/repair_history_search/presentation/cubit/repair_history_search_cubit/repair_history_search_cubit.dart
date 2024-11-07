import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../guarantee_manage/domain/entities/es_warranty_detail.dart';
import '../../../../guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';
import '../../../../guarantee_manage/domain/usecases/get_input_by_serial_no.dart';
import '../../../../guarantee_manage/domain/usecases/search.dart';
import '../../../../repair_manage/domain/entities/es_ro_detail.dart';
import '../../../../repair_manage/domain/usecases/search.dart';

part 'repair_history_search_state.dart';

class RepairHistorySearchCubit extends Cubit<RepairHistorySearchState> {
  RepairHistorySearchCubit({
    required SearchWarrantyUseCase searchWarrantyUseCase,
    required SearchROUseCase searchROUseCase,
    required GetInputBySerialNoUseCase getInputBySerialNoUseCase,
  }) : _searchWarrantyUseCase = searchWarrantyUseCase,
       _searchROUseCase = searchROUseCase,
       _getInputBySerialNoUseCase = getInputBySerialNoUseCase,
        super(RepairHistorySearchInitial());


  final SearchWarrantyUseCase _searchWarrantyUseCase;
  final SearchROUseCase _searchROUseCase;
  final GetInputBySerialNoUseCase _getInputBySerialNoUseCase;


  Future<void> init() async {
    emit(RepairHistorySearchLoaded());
  }

  Future<void> search(String query) async {
    if(query.isEmpty) {
      emit(RepairHistorySearchLoaded());
      return;
    }
    emit(RepairHistorySearchLoading());
    try {
      final url = 'HTTPS://testvgc.inos.vn:12289/PI?QR=$query';
      final scanner = await _getInputBySerialNoUseCase.call(GetInputBySerialNoParams(SerialNo: url));
      final scannerFold = scanner.fold((l) => null, (r) => r);

      final listWarranty = await _searchWarrantyUseCase.call(
        SearchWarrantyParams(
          SerialNo: query,
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
          Ft_PageSize: '200',
        ),
      );
      final listWarrantyDetail = listWarranty.fold((l) => null, (r) => r);

      final listRO = await _searchROUseCase.call(
        SearchROParams(
          RONo: '',
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
          SerialNo: query,
          Ft_PageIndex: '0',
          Ft_PageSize: '200',
        ),
      );
      final listRODetail = listRO.fold((l) => null, (r) => r);

      emit(RepairHistorySearchSearched(listQr: scannerFold ?? [],listWarranty: listWarrantyDetail ?? [], listRO: listRODetail ?? []));
    }
    catch (e) {
      emit(RepairHistorySearchError(message: e.toString()));
    }
  }
}
