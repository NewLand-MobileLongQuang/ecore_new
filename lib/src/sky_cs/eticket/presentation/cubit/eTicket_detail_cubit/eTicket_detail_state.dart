part of 'eTicket_detail_cubit.dart';

@immutable
sealed class eTicketDetailState {}

final class eTicketDetailInitial extends eTicketDetailState {}

final class eTicketDetailLoading extends eTicketDetailState {}

final class eTicketDetailStateLoaded extends eTicketDetailState {
  final SKY_GetTicketID ETID;

  eTicketDetailStateLoaded({
  required this.ETID,
});}

final class eTicketDetailStateError extends eTicketDetailState {
final String message;

eTicketDetailStateError(this.message);
}