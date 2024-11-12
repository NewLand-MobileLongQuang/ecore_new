import 'package:equatable/equatable.dart';

class SKY_CustomerHist extends Equatable {
  SKY_CustomerHist({required this.AutoId, required this.OrgID, required this.CustomerCodeSys, required this.NetworkID, required this.JsonCustomerInfoHist, required this.LUDTimeUTC, required this.LUBy, required this.LUByName, required this.LogLUDTimeUTC, required this.LogLUBy});

  final int AutoId;
  final String OrgID;
  final String CustomerCodeSys;
  final String NetworkID;
  final String JsonCustomerInfoHist;
  final String LUDTimeUTC;
  final String LUBy;
  final String LUByName;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  @override
  List<Object?> get props => [AutoId, OrgID, CustomerCodeSys, NetworkID, JsonCustomerInfoHist, LUDTimeUTC, LUBy, LUByName, LogLUDTimeUTC, LogLUBy];
}