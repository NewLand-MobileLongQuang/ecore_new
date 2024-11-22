import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_column_group.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_column_sec.dart';
import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_template.dart';
import 'package:equatable/equatable.dart';

class SKY_ETicketColumn extends Equatable {
  SKY_ETicketColumn(
      {required this.Lst_ET_MetaScreenTemplate,
        required this.Lst_ET_MetaColGroup,
        required this.Lst_ET_MetaColGroupSpec});

  final List<SKY_ETicket_MetaScreenTemplate> Lst_ET_MetaScreenTemplate;
  final List<SKY_ETicket_MetaColGroup> Lst_ET_MetaColGroup;
  final List<SKY_ETicket_MetaColGroupSpec> Lst_ET_MetaColGroupSpec;

  @override
  List<Object?> get props => [
    Lst_ET_MetaScreenTemplate,
    Lst_ET_MetaColGroup,
    Lst_ET_MetaColGroupSpec,
  ];
}