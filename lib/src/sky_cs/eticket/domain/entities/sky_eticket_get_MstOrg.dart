import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_Org.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_MstOrg extends Equatable {
  SKY_ETicket_MstOrg({required this.Lst_Mst_Org,});

  final List<SKY_ETicket_Org> Lst_Mst_Org;

  @override
  List<Object?> get props => [
    Lst_Mst_Org,
  ];
}