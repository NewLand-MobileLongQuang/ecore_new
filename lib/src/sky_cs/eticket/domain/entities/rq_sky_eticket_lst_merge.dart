import 'package:equatable/equatable.dart';

class RQ_SKY_eTicket_lst_merge extends Equatable {
  RQ_SKY_eTicket_lst_merge({
    required this.TicketID,

  });

  final String TicketID;


  @override
  List<Object?> get props => [
    TicketID,
  ];
}