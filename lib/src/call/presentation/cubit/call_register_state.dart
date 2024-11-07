part of 'call_register_cubit.dart';

@immutable
sealed class CallRegisterState {}

final class CallRegisterInitial extends CallRegisterState {}

final class CallRegisterSuccess extends CallRegisterState {}

final class CallRegisterError extends CallRegisterState {}
