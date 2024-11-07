part of 'e_service_cubit.dart';

@immutable
sealed class EServiceState {}

final class EServiceInitial extends EServiceState {}

final class EServiceLoading extends EServiceState {}

final class EServiceLoaded extends EServiceState {}

final class EServiceError extends EServiceState {
  final String message;

  EServiceError(this.message);
}