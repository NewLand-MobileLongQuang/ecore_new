import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_department_model.dart';
import '../../domain/entities/sky_eticket_get_lst_Department.dart';

class SKY_ETicket_Lst_Department_Model extends SKY_Eticket_lst_Department {
  SKY_ETicket_Lst_Department_Model({required super.Lst_Mst_Department});

  factory SKY_ETicket_Lst_Department_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_Department_Model(
      Lst_Mst_Department: (json['Lst_Mst_Department'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_Department_Model.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_Department': super.Lst_Mst_Department,
    };
  }
}