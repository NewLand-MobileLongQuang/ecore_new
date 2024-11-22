import 'package:ecore/src/sky_cs/eticket/domain/entities/sky_eticket_get_department.dart';
import 'package:equatable/equatable.dart';

class SKY_Eticket_lst_Department extends Equatable {
  SKY_Eticket_lst_Department({required this.Lst_Mst_Department,});

  final List<SKY_ETicket_Department> Lst_Mst_Department;

  @override
  List<Object?> get props => [
    Lst_Mst_Department,
  ];
}