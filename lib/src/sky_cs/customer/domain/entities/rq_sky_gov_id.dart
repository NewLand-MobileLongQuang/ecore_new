import 'package:equatable/equatable.dart';

class RQ_SKY_GovID extends Equatable {
  RQ_SKY_GovID({required this.GovID, required this.GovIDDate, required this.GovIDType, required this.OrgID, required this.CustomerCodeSys});

  final String GovID;
  final String GovIDDate;
  final String GovIDType;
  final int OrgID;
  final String CustomerCodeSys;

  @override
  List<Object?> get props => [GovID, GovIDDate, GovIDType, OrgID, CustomerCodeSys];
}