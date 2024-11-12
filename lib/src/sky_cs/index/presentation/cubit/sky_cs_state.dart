part of 'sky_cs_cubit.dart';

@immutable
sealed class SkyCsState {}

final class SkyCsInitial extends SkyCsState {}

final class SkyCsLoading extends SkyCsState {}

final class SkyCsLoaded extends SkyCsState {}

final class SkyCsError extends SkyCsState {
  SkyCsError({required this.message});
  final String message;
}