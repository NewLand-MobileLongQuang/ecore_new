part of 'customer_create_cubit.dart';

@immutable
sealed class CustomerCreateState {}

final class CustomerCreateInitial extends CustomerCreateState {}

final class CustomerCreateLoading extends CustomerCreateState {}

final class CustomerCreateLoaded extends CustomerCreateState {
  CustomerCreateLoaded({required this.customerCodeSys});

  final String customerCodeSys;
}

final class CustomerCreateSuccess extends CustomerCreateState {
  CustomerCreateSuccess({required this.customer});

  final ES_Customer customer;

}

final class CustomerCreateError extends CustomerCreateState {
  final String error;

  CustomerCreateError(this.error);
}

