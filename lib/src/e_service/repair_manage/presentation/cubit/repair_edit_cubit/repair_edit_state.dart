part of 'repair_edit_cubit.dart';

@immutable
sealed class RepairEditState {}

final class RepairEditInitial extends RepairEditState {}

final class RepairEditLoading extends RepairEditState {}

final class RepairEditLoaded extends RepairEditState {
  RepairEditLoaded({
    required this.eS_RODetail,
    required this.Lst_ES_ROComponent,
    required this.Lst_ES_ROAttachFile,
    required this.listErrorType,
    required this.listProduct,
    required this.listErrorComponent,
  });

  final ES_RODetail eS_RODetail;
  final List<ES_ROComponent> Lst_ES_ROComponent;
  final List<ES_ROAttachFile> Lst_ES_ROAttachFile;

  final List<String> listErrorType;
  final List<String> listProduct;
  final List<String> listErrorComponent;
}

final class RepairEditSuccess extends RepairEditState {}

final class RepairFinishSuccess extends RepairEditState {}

final class RepairEditError extends RepairEditState {

  RepairEditError({required this.message});
  final String message;
}