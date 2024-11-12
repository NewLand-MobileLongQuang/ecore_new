import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_customer_detail.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_by_customer_code_sys.dart';
import 'package:meta/meta.dart';

part 'customer_detail_state.dart';

class CustomerDetailCubit extends Cubit<CustomerDetailState> {
  CustomerDetailCubit({
    required GetByCustomerCodeSysUseCase getByCustomerCodeSysUseCase,
  }) : _getByCustomerCodeSysUseCase = getByCustomerCodeSysUseCase,
        super(CustomerDetailInitial());

  final GetByCustomerCodeSysUseCase _getByCustomerCodeSysUseCase;

  Future<void> init(String customerCodeSys) async {
    emit(CustomerDetailLoading());
    try {
      final result = await _getByCustomerCodeSysUseCase.call(
        GetByCustomerCodeSysParams(
          ScrTplCodeSys: 'SCRTCS.CTM.DTL.2023',
          CustomerCodeSys: customerCodeSys,
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final resultFold = result.fold((l) => null, (r) => r)!;
      emit(CustomerDetailLoaded(rt_esCustomerDetail: resultFold));
    }
    catch (e) {
      emit(CustomerDetailError(error: e.toString()));
    }
  }
}
