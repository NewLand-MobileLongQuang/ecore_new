part of 'change_view_cubit.dart';

@immutable
sealed class ChangeViewState {}

final class ChangeViewInitial extends ChangeViewState {}

final class ChangeViewLoading extends ChangeViewState {}

final class ChangeViewLoaded extends ChangeViewState {
  ChangeViewLoaded({required this.listCustomerHist});

  final List<SKY_CustomerHist> listCustomerHist;
}

final class ChangeViewError extends ChangeViewState {
  ChangeViewError({required this.message});

  final String message;
}