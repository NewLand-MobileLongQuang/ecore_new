import 'package:ecore/src/sky_cs/customer/domain/entities/sky_option_value.dart';

class SKY_OptionValueModel extends SKY_OptionValue {
  SKY_OptionValueModel({required super.Key, required super.Value, required super.OrderIdx, required super.IsSelected});

  factory SKY_OptionValueModel.fromMap(Map<String, dynamic> json) {
    return SKY_OptionValueModel(
      Key: json['Key']?.toString() ?? '',
      Value: json['Value']?.toString() ?? '',
      OrderIdx: json['OrderIdx'] is int ? json['OrderIdx'] as int : 0,
      IsSelected: json['IsSelected'] is bool ? json['IsSelected'] as bool : false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Key': super.Key,
      'Value': super.Value,
      'OrderIdx': super.OrderIdx,
      'IsSelected': super.IsSelected,
    };
  }
}