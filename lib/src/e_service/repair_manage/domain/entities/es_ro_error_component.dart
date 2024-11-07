import 'package:equatable/equatable.dart';

class ES_ROErrorComponent extends Equatable {
  ES_ROErrorComponent({required this.OrgID, required this.ProductGrpCode, required this.ProductGrpName, required this.ComponentCode, required this.NetworkID, required this.ComponentName, required this.QtyComponent, required this.FlagActive, required this.DTimeUsed, required this.LogLUDTimeUTC, required this.LogLUBy});


  final String OrgID;
  final String ProductGrpCode;
  final String ProductGrpName;
  final String ComponentCode;
  final String NetworkID;
  final String ComponentName;
  final double QtyComponent;
  final String FlagActive;
  final String DTimeUsed;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [OrgID, ProductGrpCode, ProductGrpName, ComponentCode, NetworkID, ComponentName, QtyComponent, FlagActive, DTimeUsed, LogLUDTimeUTC, LogLUBy];
}