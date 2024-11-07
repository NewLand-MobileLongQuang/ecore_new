import 'package:equatable/equatable.dart';

class ES_RODetail extends Equatable {
  ES_RODetail({required this.RONo, required this.OrgID, required this.NetworkID, required this.CustomerCodeSys, required this.CustomerName, required this.CustomerPhoneNo, required this.CustomerAddress, required this.CustomerAvatarPath, required this.ReceptionDTimeUTC, required this.AgentCode, required this.RODesc, required this.Deadline, required this.ROStatus, required this.ProductCode, required this.SerialNo, required this.FactoryCode, required this.ErrorTypeCode, required this.AppointmentDTimeUTC, required this.CreateDTimeUTC, required this.CreateBy, required this.Remark, required this.FinishDTimeUser, required this.FinishDTimeUTC, required this.FinishBy, required this.LUDTimeUTC, required this.LUBy, required this.LogLUDTimeUTC, required this.LogLUBy, required this.AgentName, required this.AgentAvatar, required this.ListComponentCode});

  final String RONo;
  final String OrgID;
  final String NetworkID;
  final String CustomerCodeSys;
  final String CustomerName;
  final String CustomerPhoneNo;
  final String CustomerAddress;
  final String CustomerAvatarPath;
  final String ReceptionDTimeUTC;
  final String AgentCode;
  final String RODesc;
  final String Deadline;
  final String ROStatus;
  String ProductCode;
  String SerialNo;
  final String FactoryCode;
  String ErrorTypeCode;
  String AppointmentDTimeUTC;
  final String CreateDTimeUTC;
  final String CreateBy;
  String Remark;
  final String FinishDTimeUser;
  final String FinishDTimeUTC;
  final String FinishBy;
  final String LUDTimeUTC;
  final String LUBy;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String AgentName;
  final String AgentAvatar;
  final String? ListComponentCode;

  @override
  List<Object?> get props => [RONo, OrgID, NetworkID, CustomerCodeSys, CustomerName, CustomerPhoneNo, CustomerAddress, CustomerAvatarPath, ReceptionDTimeUTC, AgentCode, RODesc, Deadline, ROStatus, ProductCode, SerialNo, FactoryCode, ErrorTypeCode, AppointmentDTimeUTC, CreateDTimeUTC, CreateBy, Remark, FinishDTimeUTC, FinishBy, LUDTimeUTC, LUBy, LogLUDTimeUTC, LogLUBy, AgentName, AgentAvatar, ListComponentCode];
}