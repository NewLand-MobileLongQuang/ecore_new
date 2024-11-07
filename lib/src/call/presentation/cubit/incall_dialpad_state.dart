part of 'incall_dialpad_cubit.dart';


sealed class IncallDialpadState {}

final class IncallDialpadInitial extends IncallDialpadState {}

final class IncallDialpadLoading extends IncallDialpadState {}

final class IncallDialpadCalling extends IncallDialpadState {
  IncallDialpadCalling({required this.hotline, required this.phoneNumber});

  final String hotline;
  final String phoneNumber;
}

final class IncallDialpadCallSuccess extends IncallDialpadState {
  IncallDialpadCallSuccess({required this.hotline, required this.phoneNumber});

  final String hotline;
  final String phoneNumber;
}

final class IncallDialpadInputLoaded extends IncallDialpadState {
  IncallDialpadInputLoaded({required this.phoneNumber});

  final String phoneNumber;
}

final class IncallDialpadError extends IncallDialpadState {
  final String message;

  IncallDialpadError(this.message);
}

