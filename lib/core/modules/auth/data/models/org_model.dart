import 'dart:convert';

import '../../../../utils/typedef.dart';
import '../../domain/entities/org.dart';


class OrgModel extends Org {
  const OrgModel(
      {required super.Id,
      required super.ParentId,
      required super.Name,
      required super.ShortName});

  OrgModel.fromBase(Org base)
      : this(
          Id: base.Id,
          ParentId: base.ParentId,
          Name: base.Name,
          ShortName: base.ShortName,
        );

  OrgModel.fromMap(DataMap map)
      : this(
          Id: map['Id'] as int,
          ParentId: map['ParentId'] as int,
          Name: map['Name'] as String?,
          ShortName: map['ShortName'] as String?,
        );

  DataMap toMap() => {
        'Id': Id,
        'ParentId': ParentId,
        'Name': Name,
        'ShortName': ShortName,
      };

  factory OrgModel.fromJson(String source) =>
      OrgModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  OrgModel copyWith({
    int? Id,
    int? ParentId,
    String? Name,
    String? ShortName,
  }) {
    return OrgModel(
      Id: Id ?? this.Id,
      ParentId: ParentId ?? this.ParentId,
      Name: Name ?? this.Name,
      ShortName: ShortName ?? this.ShortName,
    );
  }
}
