part of 'repair_manage_cubit.dart';

@immutable
sealed class RepairManageState {}

final class RepairManageInitial extends RepairManageState {}

final class RepairManageLoading extends RepairManageState {}

final class RepairManageLoaded extends RepairManageState {
  RepairManageLoaded({required this.list,});

  final List<ES_RODetail> list;
}

final class RepairManageLoadingMore extends RepairManageLoaded {
  RepairManageLoadingMore({required super.list});
}

final class RepairManageError extends RepairManageState {
  RepairManageError(this.message);

  final String message;
}