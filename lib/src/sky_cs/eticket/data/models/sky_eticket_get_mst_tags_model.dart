import 'package:ecore/src/sky_cs/eticket/data/models/sky_eticket_tag_model.dart';
import '../../domain/entities/sky_eticket_get_Tags.dart';

class SKY_ETicketMstTagsModel extends SKY_ETicket_MstTags {
  SKY_ETicketMstTagsModel({required super.Lst_Mst_Tag});
  
  factory SKY_ETicketMstTagsModel.fromJson(Map<String, dynamic> json)
  {
    return SKY_ETicketMstTagsModel(
      Lst_Mst_Tag: (json['Lst_Mst_Tag'] as List<dynamic>?)
        ?.map((item) => SKY_ETicket_Tag_Model.fromMap(item as Map<String, dynamic>))
        .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Mst_Tag': super.Lst_Mst_Tag,
    };
  }
}