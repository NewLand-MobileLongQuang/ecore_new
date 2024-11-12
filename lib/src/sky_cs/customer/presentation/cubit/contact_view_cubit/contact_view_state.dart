part of 'contact_view_cubit.dart';

@immutable
sealed class ContactViewState {}

final class ContactViewInitial extends ContactViewState {}

final class ContactViewLoading extends ContactViewState {}

final class ContactViewLoaded extends ContactViewState {
  ContactViewLoaded({required this.listCustomerContact});

  final List<SKY_CustomerContact> listCustomerContact;
}

final class ContactViewError extends ContactViewState {
  ContactViewError({required this.message});

  final String message;
}