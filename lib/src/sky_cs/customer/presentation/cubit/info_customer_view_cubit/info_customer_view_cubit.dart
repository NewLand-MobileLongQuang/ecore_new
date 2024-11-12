import 'package:bloc/bloc.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_column_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_group_model.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_group.dart';
import 'package:meta/meta.dart';

part 'info_customer_view_state.dart';

class InfoCustomerViewCubit extends Cubit<InfoCustomerViewState> {
  InfoCustomerViewCubit({
    required SearchCustomerGroupUseCase searchCustomerGroupUseCase,
    required SearchCustomerColumnUseCase searchCustomerColumnUseCase,
  }) : _searchCustomerGroupUseCase = searchCustomerGroupUseCase,
        _searchCustomerColumnUseCase = searchCustomerColumnUseCase,
        super(InfoCustomerViewInitial());

  final SearchCustomerGroupUseCase _searchCustomerGroupUseCase;
  final SearchCustomerColumnUseCase _searchCustomerColumnUseCase;

  Future<void> init() async {
    emit(InfoCustomerViewLoading());
    try {
      final listGroup = await _searchCustomerGroupUseCase.call(
        const SearchCustomerGroupParams(
          ScrTplCodeSys: 'ScrTplCodeSys.2023',
          FlagActive: '1',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final listColumn = await _searchCustomerColumnUseCase.call(
        const SearchCustomerColumnParams(
          ScrTplCodeSys: 'ScrTplCodeSys.2023',
          FlagActive: '1',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
          OrderByClause: 'ProvinceCode asc',
        ),
      );
      final listGroupFold = listGroup.fold((l) => l, (r) => r) as List<SKY_CustomerGroupModel>;
      final listColumnFold = listColumn.fold((l) => l, (r) => r) as List<SKY_CustomerColumnModel>;
      emit(InfoCustomerViewLoaded(listGroupFold: listGroupFold, listColumnFold: listColumnFold));
    } catch (e) {
      emit(InfoCustomerViewError(message: e.toString()));
    }
  }
}
