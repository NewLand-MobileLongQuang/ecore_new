import '../../domain/entities/sky_eticket_get_Mst_Tags.dart';

class SKY_ETicket_Tag_Model extends SKY_ETicket_Mst_Tag {
  SKY_ETicket_Tag_Model(
      {required super.NetworkID, required super.LogLUDTimeUTC, required super.LogLUBy, required super.TagID, required super.TagName, required super.TagDesc, required super.Slug, required super.FlagActive,});

  factory SKY_ETicket_Tag_Model.fromMap(Map<String, dynamic> json) {
    return SKY_ETicket_Tag_Model(
      NetworkID: json['NetworkID']?.toString() ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC']?.toString() ?? '',
      LogLUBy: json['LogLUBy']?.toString() ?? '',
      TagID: json['TagID']?.toString() ?? '',
      TagName: json['TagName']?.toString() ?? '',
      TagDesc: json['TagDesc']?.toString() ?? '',
      Slug: json['Slug']?.toString() ?? '',
      FlagActive: json['FlagActive']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'NetworkID': super.NetworkID,
      'LogLUDTimeUTC': super.LogLUDTimeUTC,
      'LogLUBy': super.LogLUBy,
      'TagID': super.TagID,
      'TagName': super.TagName,
      'TagDesc': super.TagDesc,
      'Slug': super.Slug,
      'FlagActive': super.FlagActive,
    };
  }
}