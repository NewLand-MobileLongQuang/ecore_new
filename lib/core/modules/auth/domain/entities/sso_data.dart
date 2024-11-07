import 'package:equatable/equatable.dart';

class SSOData extends Equatable
{

  const SSOData({required this.Data});
  final String Data;

  @override
  List<Object?> get props => [Data];
}