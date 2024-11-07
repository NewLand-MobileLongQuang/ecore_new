part of 'guarantee_detail_cubit.dart';

@immutable
sealed class GuaranteeDetailState {}

final class GuaranteeDetailInitial extends GuaranteeDetailState {}

final class GuaranteeDetailLoading extends GuaranteeDetailState {}

final class GuaranteeDetailLoaded extends GuaranteeDetailState {
  GuaranteeDetailLoaded({
    required this.eS_WarrantyDetail,
    required this.Lst_ES_WarrantyAttachFile,
  });

  final ES_WarrantyDetail eS_WarrantyDetail;
  final List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile;
}

final class GuaranteeDetailDeleteSuccess extends GuaranteeDetailState {}

final class GuaranteeDetailError extends GuaranteeDetailState {

  GuaranteeDetailError({required this.message});
  final String message;
}
