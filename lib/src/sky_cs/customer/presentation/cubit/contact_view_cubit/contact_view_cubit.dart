import 'package:bloc/bloc.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_contact.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_contact.dart';
import 'package:meta/meta.dart';

part 'contact_view_state.dart';

class ContactViewCubit extends Cubit<ContactViewState> {
  ContactViewCubit({
    required SearchCustomerContactUseCase searchCustomerContactUseCase,
  }) : _searchCustomerContactUseCase = searchCustomerContactUseCase,
        super(ContactViewInitial());

  final SearchCustomerContactUseCase _searchCustomerContactUseCase;

  Future<void> init(String customerCodeSys) async {
    emit(ContactViewLoading());
    try {
      final listCustomerContact = await _searchCustomerContactUseCase(
        SearchCustomerContactParams(
            CustomerCodeSys: customerCodeSys,
            Ft_PageIndex: '0',
            Ft_PageSize: '1000',
            OrderByClause:'',
            FlagActive:''
        ),
      );
      final listCustomerContactFold = listCustomerContact.fold((l) => l, (r) => r) as List<SKY_CustomerContact>;
      emit(ContactViewLoaded(listCustomerContact: listCustomerContactFold)) ;
    } catch (e) {
      emit(ContactViewError(message: e.toString()));
    }
  }
}
