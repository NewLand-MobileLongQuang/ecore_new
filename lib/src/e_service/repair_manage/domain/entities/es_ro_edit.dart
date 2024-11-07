import 'package:equatable/equatable.dart';

class ES_ROEdit extends Equatable{
  ES_ROEdit({required this.OrgID, required this.RONo, required this.ReceptionDTimeUTC, required this.CustomerCodeSys, required this.CustomerName, required this.CustomerPhoneNo, required this.CustomerAddress, required this.AgentCode, required this.RODesc, required this.Deadline, required this.ProductCode, required this.SerialNo, required this.FactoryCode, required this.ErrorTypeCode, required this.ROStatus, required this.AppointmentDTimeUTC, required this.Remark});

  final String OrgID;
  final String RONo;
  final String ReceptionDTimeUTC;
  final String CustomerCodeSys;
  final String CustomerName;
  final String CustomerPhoneNo;
  final String CustomerAddress;
  final String AgentCode;
  final String RODesc;
  final String Deadline;
  final String ProductCode;
  final String SerialNo;
  final String FactoryCode;
  final String ErrorTypeCode;
  final String ROStatus;
  final String AppointmentDTimeUTC;
  final String Remark;

  @override
  List<Object?> get props => [OrgID, RONo, ReceptionDTimeUTC, CustomerCodeSys, CustomerName, CustomerPhoneNo, CustomerAddress, AgentCode, RODesc, Deadline, ProductCode, SerialNo, FactoryCode, ErrorTypeCode, ROStatus, AppointmentDTimeUTC, Remark];
}