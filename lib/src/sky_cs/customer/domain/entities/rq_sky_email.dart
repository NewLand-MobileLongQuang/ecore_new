import 'package:equatable/equatable.dart';

class RQ_SKY_Email extends Equatable {
  RQ_SKY_Email({required this.OrgID, required this.CustomerCodeSys, required this.CtmEmail, required this.FlagDefault});

  final String OrgID;
  final String CustomerCodeSys;
  final String CtmEmail;
  final String FlagDefault;

  @override
  List<Object?> get props => [
    OrgID,
    CustomerCodeSys,
    CtmEmail,
    FlagDefault,
  ];
}