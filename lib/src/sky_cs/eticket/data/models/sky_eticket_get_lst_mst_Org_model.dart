import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_get_Org_model.dart';
import '../../domain/entities/sky_eticket_get_MstOrg.dart';

class SKY_ETicket_Lst_Mst_Orgs_Model extends SKY_ETicket_MstOrg {
  SKY_ETicket_Lst_Mst_Orgs_Model({required super.Lst_Mst_Org});

  factory SKY_ETicket_Lst_Mst_Orgs_Model.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicket_Lst_Mst_Orgs_Model(
      Lst_Mst_Org: (json['Lst_Mst_Org'] as List<dynamic>?)
          ?.map((item) => SKY_ETicket_Org_Model.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_Org': super.Lst_Mst_Org,
    };
  }
}