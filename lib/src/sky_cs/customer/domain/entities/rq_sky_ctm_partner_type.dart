import 'package:equatable/equatable.dart';

class RQ_SKY_CtmPartnerType extends Equatable {
  RQ_SKY_CtmPartnerType({required this.OrgID, required this.PartnerType});

  final String OrgID;
  final String PartnerType;

  @override
  List<Object?> get props => [OrgID, PartnerType];
}