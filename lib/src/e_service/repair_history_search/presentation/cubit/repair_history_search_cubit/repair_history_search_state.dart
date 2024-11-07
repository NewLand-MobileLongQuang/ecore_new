part of 'repair_history_search_cubit.dart';

@immutable
sealed class RepairHistorySearchState {}

final class RepairHistorySearchInitial extends RepairHistorySearchState {}

final class RepairHistorySearchLoading extends RepairHistorySearchState {}

final class RepairHistorySearchLoaded extends RepairHistorySearchState {}

final class RepairHistorySearchSearched extends RepairHistorySearchState {
  RepairHistorySearchSearched({required this.listQr, required this.listWarranty, required this.listRO});

  final List<RT_ES_WarrrantyActivateByQR> listQr;
  final List<ES_WarrantyDetail> listWarranty;
  final List<ES_RODetail> listRO;
}

final class RepairHistorySearchError extends RepairHistorySearchState {
  RepairHistorySearchError({required this.message});

  final String message;
}