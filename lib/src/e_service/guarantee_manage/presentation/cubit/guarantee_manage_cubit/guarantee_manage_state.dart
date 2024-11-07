part of 'guarantee_manage_cubit.dart';

@immutable
sealed class GuaranteeManageState {}

final class GuaranteeManageInitial extends GuaranteeManageState {}

final class GuaranteeManageLoading extends GuaranteeManageState {}

final class GuaranteeManageLoaded extends GuaranteeManageState {

  GuaranteeManageLoaded({required this.list});
  final List<ES_WarrantyDetail> list;
}

final class GuaranteeManageDeleteSuccess extends GuaranteeManageState {}

final class GuaranteeManageError extends GuaranteeManageState {
  GuaranteeManageError(this.message);

  final String message;
}
