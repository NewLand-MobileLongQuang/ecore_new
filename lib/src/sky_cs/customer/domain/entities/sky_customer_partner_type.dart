import 'package:equatable/equatable.dart';

class SKY_CustomerPartnerType extends Equatable {
  const SKY_CustomerPartnerType({required this.PartnerType, required this.PartnerTypeName, required this.NetworkID, required this.FlagActive, required this.LogLUDTimeUTC, required this.LogLUBy});

  final String PartnerType;
  final String PartnerTypeName;
  final String NetworkID;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [PartnerType, PartnerTypeName, NetworkID, FlagActive, LogLUDTimeUTC, LogLUBy];
}