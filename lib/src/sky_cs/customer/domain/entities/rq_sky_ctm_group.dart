import 'package:equatable/equatable.dart';

class RQ_SKY_CtmGroup extends Equatable {
  RQ_SKY_CtmGroup({required this.OrgID, required this.CustomerCodeSys, required this.CustomerGrpCode});

  final String OrgID;
  final String CustomerCodeSys;
  final String CustomerGrpCode;

  @override
  List<Object?> get props => [OrgID, CustomerCodeSys, CustomerGrpCode];

}