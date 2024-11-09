import 'package:equatable/equatable.dart';

class ES_ROComponent extends Equatable {
  ES_ROComponent({required this.ProductGrpCode, required this.ComponentCode, required this.ComponentName});

  final String ProductGrpCode;
  final String ComponentCode;
  final String ComponentName;
  @override
  List<Object?> get props => [ProductGrpCode, ComponentCode];
}