import 'package:bloc/bloc.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_hist.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_hist.dart';
import 'package:meta/meta.dart';

part 'change_view_state.dart';

class ChangeViewCubit extends Cubit<ChangeViewState> {
  ChangeViewCubit({
    required SearchCustomerHistUseCase searchCustomerHistUseCase,
  }) : _searchCustomerHistUseCase = searchCustomerHistUseCase,
        super(ChangeViewInitial());

  final SearchCustomerHistUseCase _searchCustomerHistUseCase;

  Future<void> init(String customerCodeSys) async {
    emit(ChangeViewLoading());
    try {
      final listCustomerHist = await _searchCustomerHistUseCase(
        SearchCustomerHistParams(
          CustomerCodeSys: customerCodeSys,
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final listCustomerHistFold = listCustomerHist.fold((l) => l, (r) => r) as List<SKY_CustomerHist>;
      emit(ChangeViewLoaded(listCustomerHist: listCustomerHistFold)) ;
    } catch (e) {
      emit(ChangeViewError(message: e.toString()));
    }
  }
}
