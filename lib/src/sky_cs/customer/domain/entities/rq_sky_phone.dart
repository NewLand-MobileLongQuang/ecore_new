import 'package:equatable/equatable.dart';

class RQ_SKY_Phone extends Equatable {
  RQ_SKY_Phone({required this.OrgID, required this.CustomerCodeSys, required this.CtmPhoneNo, required this.FlagDefault});

  final String OrgID;
  final String CustomerCodeSys;
  final String CtmPhoneNo;
  final String FlagDefault;

  @override
  List<Object?> get props => [
    OrgID,
    CustomerCodeSys,
    CtmPhoneNo,
    FlagDefault,
  ];
}