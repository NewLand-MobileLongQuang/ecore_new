part of 'guarantee_edit_cubit.dart';

@immutable
sealed class GuaranteeEditState {}

final class GuaranteeEditInitial extends GuaranteeEditState {}

final class GuaranteeEditLoading extends GuaranteeEditState {}

final class GuaranteeEditLoaded extends GuaranteeEditState {
  GuaranteeEditLoaded({
    required this.eS_WarrantyDetail,
    required this.Lst_ES_WarrantyAttachFile,
  });

  final ES_WarrantyDetail eS_WarrantyDetail;
  final List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile;
}

final class GuaranteeEditSuccess extends GuaranteeEditState {}

final class GuaranteeEditError extends GuaranteeEditState {

  GuaranteeEditError({required this.message});
  final String message;
}
