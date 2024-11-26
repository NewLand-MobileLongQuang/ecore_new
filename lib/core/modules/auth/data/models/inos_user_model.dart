import 'dart:convert';

import '../../../../utils/typedef.dart';
import '../../domain/entities/inos_user.dart';


class UserModel extends InosUser {
  UserModel({
    required super.Id,
    required super.Email,
    required super.Name,
    required super.Avatar,
    required super.Language,
    required super.Phone,
  });

  UserModel.fromBase(InosUser base)
      : this(
    Id: base.Id,
    Email: base.Email,
    Name: base.Name,
    Avatar: base.Avatar,
    Language: base.Language,
    Phone: base.Phone,
  );
  UserModel.fromMap(DataMap map)
      : this(
    Id: map['Id'] as int,
    Email: map['Email'] as String?,
    Name: map['Name'] as String?,
    Avatar: map['Avatar'] as String?,
    Language: map['Language'] as String?,
    Phone: map['Phone'] as String?,
  );

  DataMap toMap() =>
      {
        'Id': Id,
        'Email': Email,
        'Name': Name,
        'Avatar': Avatar,
        'Phone': Phone,
        'Language': Language,
      };

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  UserModel copyWith({
    int? Id,
    String? Email,
    String? Name,
    String? Phone,
    String? Avatar,
    int? TimeZone,
    String? Language}) {
    return UserModel(
        Id: Id ?? this.Id,
        Email: Email ?? this.Email,
        Name: Name ?? this.Name,
        Phone: Phone ?? this.Phone,
        Avatar: Avatar ?? this.Avatar,
        Language: Language ?? this.Language,

    );
  }
}
