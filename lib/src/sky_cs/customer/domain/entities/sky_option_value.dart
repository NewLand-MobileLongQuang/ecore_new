import 'package:equatable/equatable.dart';

class SKY_OptionValue extends Equatable {
  SKY_OptionValue({required this.Key, required this.Value, required this.OrderIdx, required this.IsSelected});

  final String Key;
  final String Value;
  final int OrderIdx;
  final bool IsSelected;

  @override
  List<Object?> get props => [Key, Value, OrderIdx, IsSelected];
}