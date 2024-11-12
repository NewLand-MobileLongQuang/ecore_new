import 'package:equatable/equatable.dart';

class RQ_SKY_CustomerDelete extends Equatable {
  const RQ_SKY_CustomerDelete({required this.OrgID, required this.CustomerCodeSys, required this.NetworkID});

  final String OrgID;
  final String CustomerCodeSys;
  final String NetworkID;

  @override
  List<Object?> get props => [
    OrgID,
    CustomerCodeSys,
    NetworkID,
  ];
}