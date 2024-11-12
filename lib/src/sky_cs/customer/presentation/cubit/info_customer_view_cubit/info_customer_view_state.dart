part of 'info_customer_view_cubit.dart';

@immutable
sealed class InfoCustomerViewState {}

final class InfoCustomerViewInitial extends InfoCustomerViewState {}

final class InfoCustomerViewLoading extends InfoCustomerViewState {}

final class InfoCustomerViewLoaded extends InfoCustomerViewState {
  InfoCustomerViewLoaded({
    required this.listGroupFold,
    required this.listColumnFold,
  });

  final List<SKY_CustomerGroupModel> listGroupFold;
  final List<SKY_CustomerColumnModel> listColumnFold;
}

final class InfoCustomerViewError extends InfoCustomerViewState {
  InfoCustomerViewError({required this.message});

  final String message;
}