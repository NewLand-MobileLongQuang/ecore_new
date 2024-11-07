part of 'repair_detail_cubit.dart';

@immutable
sealed class RepairDetailState {}

final class RepairDetailInitial extends RepairDetailState {}

final class RepairDetailLoading extends RepairDetailState {}

final class RepairDetailLoaded extends RepairDetailState {
  RepairDetailLoaded({required this.eS_RODetail, required this.Lst_ES_ROAttachFile, required this.Lst_ES_ROComponent});

  final ES_RODetail eS_RODetail;
  final List<ES_ROAttachFile> Lst_ES_ROAttachFile;
  final List<ES_ROComponent> Lst_ES_ROComponent;
}

final class RepairDetailDeleteSuccess extends RepairDetailState {}

final class RepairDetailError extends RepairDetailState {
  RepairDetailError({required this.message});
  final String message;
}

