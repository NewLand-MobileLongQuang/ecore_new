import 'package:equatable/equatable.dart';

class ES_ROComponent extends Equatable {
  ES_ROComponent({required this.ProductGrpCode, required this.ComponentCode});

  final String ProductGrpCode;
  final String ComponentCode;
  @override
  List<Object?> get props => [ProductGrpCode, ComponentCode];
}