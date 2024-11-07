import 'dart:convert';

import '../../../../utils/typedef.dart';
import '../../domain/entities/locale_item.dart';

class AddLocaleItemModel{
  final String cate;
  final String value;

  AddLocaleItemModel(this.cate, this.value);

  DataMap toMap() => {
    'cate': cate,
    'value': value,
  };
}
class LocaleItemModel extends LocaleItem {
  const LocaleItemModel({required super.key, required super.value});

  LocaleItemModel.fromMap(DataMap map)
      : this(
          key: map['key'] as String,
          value: map['value'] as String,
        );

  DataMap toMap() => {
        'key': key,
        'value': value,
      };

  factory LocaleItemModel.fromJson(String source) =>
      LocaleItemModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  LocaleItemModel copyWith({
    String? key,
    String? value,
  }) {
    return LocaleItemModel(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }
}
