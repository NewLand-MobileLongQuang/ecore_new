import 'package:equatable/equatable.dart';

class RT_ES_WarrrantyActivateByQR extends Equatable {
  RT_ES_WarrrantyActivateByQR({
    required this.SerialNo,
    required this.ProductCode,
    required this.ProductCodeUser,
    required this.ProductName,
    required this.ProductionDTimeUTC,
    required this.FactoryCode,
    required this.KCS,
    required this.ProductExpiry,
  });

  final String SerialNo;
  final String ProductCode;
  final String ProductCodeUser;
  final String ProductName;
  final String ProductionDTimeUTC;
  final String FactoryCode;
  final String KCS;
  final String ProductExpiry;

  @override
  List<Object?> get props => [SerialNo, ProductCode, ProductCodeUser, ProductionDTimeUTC, FactoryCode, KCS, ProductExpiry];
}