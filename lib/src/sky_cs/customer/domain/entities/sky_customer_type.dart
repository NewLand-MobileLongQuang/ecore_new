import 'package:equatable/equatable.dart';

class SKY_CustomerType extends Equatable {
  SKY_CustomerType({required this.CustomerType, required this.CustomerTypeName});

  final String CustomerType;
  final String CustomerTypeName;

  @override
  List<Object?> get props => [CustomerType, CustomerTypeName];
}