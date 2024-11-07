

import '../../domain/entities/es_ro_delete.dart';

class ES_RODeleteModel extends ES_RODelete {
  ES_RODeleteModel({required super.RONO, required super.OrgID});

  factory ES_RODeleteModel.fromJson(Map<String, dynamic> json) {
    return ES_RODeleteModel(
      RONO: json['RONO'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RONO': RONO,
      'OrgID': OrgID,
    };
  }
}