import 'dart:convert';

import '../../../../utils/typedef.dart';
import '../../domain/entities/sso_data.dart';

class SSODataModel extends SSOData {
  SSODataModel({required super.Data});


  SSODataModel.fromBase(SSOData base)
      : this(
    Data: base.Data
  );


  SSODataModel.fromMap(DataMap map)
      : this(
          Data: map['Data'] as String,
        );

  DataMap toMap() => {
        'Data': Data,
      };

  factory SSODataModel.fromJson(String source) =>
      SSODataModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  SSODataModel copyWith({
    String? Data,
  }) {
    return SSODataModel(
      Data: Data ?? this.Data,
    );
  }
}
