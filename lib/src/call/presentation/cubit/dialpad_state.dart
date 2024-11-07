part of 'dialpad_cubit.dart';


@immutable
sealed class DialpadState {}

final class DialpadInitial extends DialpadState {}

final class DialpadLoading extends DialpadState {}

final class DialpadCalling extends DialpadState {
  DialpadCalling({required this.hotline, required this.phoneNumber});

  final String hotline;
  final String phoneNumber;
}

final class DialpadCallSuccess extends DialpadState {
  DialpadCallSuccess({required this.hotline, required this.phoneNumber});

  final String hotline;
  final String phoneNumber;
}

final class DialpadInputLoaded extends DialpadState {
  DialpadInputLoaded({required this.phoneNumber});

  final String phoneNumber;
}

final class DialpadError extends DialpadState {
  final String message;

  DialpadError(this.message);
}

