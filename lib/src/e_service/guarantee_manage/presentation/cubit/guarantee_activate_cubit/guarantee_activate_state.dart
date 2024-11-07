part of 'guarantee_activate_cubit.dart';

@immutable
sealed class GuaranteeActivateState {}

final class GuaranteeActivateInitial extends GuaranteeActivateState {}

final class GuaranteeActivateLoading extends GuaranteeActivateState {}

final class GuaranteeActivateLoaded extends GuaranteeActivateState {
  GuaranteeActivateLoaded({
    required this.rT_ES_WarrrantyActivateByQR,
    required this.eS_Customer,
    required this.eS_WarrantyInstall,
  });

  final RT_ES_WarrrantyActivateByQR rT_ES_WarrrantyActivateByQR;
  final ES_Customer eS_Customer;
  final ES_WarrantyInstall eS_WarrantyInstall;
}

final class GuaranteeActivateScanned extends GuaranteeActivateState {

  GuaranteeActivateScanned(this.rT_ES_WarrrantyActivateByQR);
  final RT_ES_WarrrantyActivateByQR rT_ES_WarrrantyActivateByQR;
}

final class GuaranteeActivateSuccess extends GuaranteeActivateState {}

final class GuaranteeActivateError extends GuaranteeActivateState {

  GuaranteeActivateError(this.message);
  final String message;
}
