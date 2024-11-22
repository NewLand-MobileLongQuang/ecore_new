import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_Mst_Tags.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicket_MstTags extends Equatable {
  SKY_ETicket_MstTags(
      {required this.Lst_Mst_Tag,});

  final List<SKY_ETicket_Mst_Tag> Lst_Mst_Tag;

  @override
  List<Object?> get props => [
    Lst_Mst_Tag,
  ];
}