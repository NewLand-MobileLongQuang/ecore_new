import 'package:equatable/equatable.dart';

class RQ_SKY_UserManager extends Equatable {
  RQ_SKY_UserManager({required this.OrgID, required this.UserCodeMng});

  final String OrgID;
  final String UserCodeMng;

  @override
  List<Object?> get props => [OrgID, UserCodeMng];

}