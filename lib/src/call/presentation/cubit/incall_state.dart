part of 'incall_cubit.dart';

sealed class IncallState extends Equatable {
  const IncallState();
  @override
  List<Object> get props => [];
}

final class IncallInitial extends IncallState {}
final class IncallForward extends IncallState {}
final class IncallDialpad extends IncallState {}
