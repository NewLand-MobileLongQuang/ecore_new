import 'package:equatable/equatable.dart';

class RQ_SKY_eTicket_lst_split extends Equatable {
  RQ_SKY_eTicket_lst_split({
    required this.TicketID,
    required this.AutoID,

  });

  final String TicketID;
  final int AutoID;


  @override
  List<Object?> get props => [
    TicketID,
    AutoID
  ];
}