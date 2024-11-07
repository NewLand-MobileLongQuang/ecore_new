part of 'customer_detail_cubit.dart';

@immutable
sealed class CustomerDetailState {}

final class CustomerDetailInitial extends CustomerDetailState {}

final class CustomerDetailLoading extends CustomerDetailState {}

final class CustomerDetailLoaded extends CustomerDetailState {
  CustomerDetailLoaded({required this.rt_esCustomerDetail});

  final RT_ESCustomerDetail rt_esCustomerDetail;
}

final class CustomerDetailError extends CustomerDetailState {
  CustomerDetailError({required this.error});

  final String error;
}