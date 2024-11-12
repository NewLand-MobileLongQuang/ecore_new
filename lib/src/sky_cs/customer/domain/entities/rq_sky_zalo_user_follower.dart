import 'package:equatable/equatable.dart';

class RQ_SKY_ZaloUserFollower extends Equatable {
  RQ_SKY_ZaloUserFollower({required this.OrgID, required this.CustomerCodeSys, required this.ZaloUserFollowerId, required this.SolutionCode, required this.FlagDefault});

  final String OrgID;
  final String CustomerCodeSys;
  final String ZaloUserFollowerId;
  final String SolutionCode;
  final String FlagDefault;

  @override
  List<Object?> get props => [
    OrgID,
    CustomerCodeSys,
    ZaloUserFollowerId,
    SolutionCode,
    FlagDefault,
  ];
}