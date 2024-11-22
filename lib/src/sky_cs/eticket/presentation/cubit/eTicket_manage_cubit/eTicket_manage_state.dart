part of 'eTicket_manage_cubit.dart';

@immutable
sealed class eTicketManageState {}

final class eTicketManageInitial extends eTicketManageState {}

final class eTicketManageLoading extends eTicketManageState {}

final class eTicketManageLoaded extends eTicketManageState {
final List<SKY_TicketInfo> listeticket;

eTicketManageLoaded({
  required this.listeticket,
});
}

final class eTicketManageError extends eTicketManageState {
final String message;
eTicketManageError(this.message);
}
final class eTicketCreateStateSuccess extends eTicketManageState {

}
