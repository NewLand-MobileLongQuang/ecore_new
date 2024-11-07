part of 'customer_manage_cubit.dart';

@immutable
sealed class CustomerManageState {}

final class CustomerManageInitial extends CustomerManageState {}

final class CustomerManageLoading extends CustomerManageState {}

final class CustomerManageLoaded extends CustomerManageState {
  CustomerManageLoaded({required this.listCustomer});
  final List<ES_Customer> listCustomer;
}

final class CustomerManageGetSuccess extends CustomerManageState {
  CustomerManageGetSuccess({required this.customer});
  final ES_Customer customer;
}

final class CustomerManageError extends CustomerManageState {
  CustomerManageError(this.message);
  final String message;
}