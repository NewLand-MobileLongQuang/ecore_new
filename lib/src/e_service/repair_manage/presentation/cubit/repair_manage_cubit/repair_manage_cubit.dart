import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/domain/usecases/search.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'repair_manage_state.dart';

class RepairManageCubit extends Cubit<RepairManageState> {
  RepairManageCubit({
    required SearchROUseCase searchROUseCase,})
      : _searchROUseCase = searchROUseCase,
        super(RepairManageInitial());

  final SearchROUseCase _searchROUseCase;

  List<ES_RODetail>? listDetail;

  Future<void> init() async {
    emit(RepairManageLoading());
    try {
      final list = await _searchROUseCase.call(
        const SearchROParams(
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
          SerialNo: '',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('cached_email') ?? '';
      listDetail =
          list.fold((l) => null, (r) => r)
              ?.where((element) => element.AgentCode.toUpperCase() == email.toUpperCase()).toList();
      listDetail?.sort((a, b) => b.ReceptionDTimeUTC.compareTo(a.ReceptionDTimeUTC) != 0
        ? b.ReceptionDTimeUTC.compareTo(a.ReceptionDTimeUTC)
        : b.AppointmentDTimeUTC.compareTo(a.AppointmentDTimeUTC),
      );
      emit(RepairManageLoaded(list: listDetail ?? []));
    } catch (e) {
      emit(RepairManageError(e.toString()));
    }
  }

  Future<void> search(String query) async {
    emit(RepairManageLoading());
    try{
      final list = await _searchROUseCase.call(
        const SearchROParams(
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
          SerialNo: '',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('cached_email') ?? '';
      final listSearch = list.fold((l) => null, (r) => r)
          ?.where((element) => element.AgentCode.toUpperCase() == email.toUpperCase()).toList().where((element) {
        return element.CustomerName.toLowerCase().contains(query.toLowerCase())
            || element.CustomerPhoneNo.toLowerCase().contains(query.toLowerCase())
            || element.CustomerAddress.toLowerCase().contains(query.toLowerCase())
            || element.ROStatus.toLowerCase().contains(query.toLowerCase())
            || element.RODesc.toLowerCase().contains(query.toLowerCase())
            || element.RONo.toLowerCase().contains(query.toLowerCase()) ;
      }).toList();
      emit(RepairManageLoaded(list: listSearch ?? []));
    }
    catch(e) {
      emit(RepairManageError(e.toString()));
    }
  }
}
