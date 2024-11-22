

import '../../domain/entities/es_ro_edit.dart';

class ES_ROEditModel extends ES_ROEdit {
  ES_ROEditModel({required super.OrgID, required super.RONo, required super.ReceptionDTimeUTC, required super.CustomerCodeSys, required super.CustomerName, required super.CustomerPhoneNo, required super.CustomerAddress, required super.AgentCode, required super.RODesc, required super.Deadline, required super.ProductCode, required super.SerialNo, required super.FactoryCode, required super.ErrorTypeCode, required super.ROStatus, required super.AppointmentDTimeUTC, required super.Remark});

  factory ES_ROEditModel.fromJson(Map<String, dynamic> json) {
    return ES_ROEditModel(
      OrgID: json['OrgID'] as String? ?? '',
      RONo: json['RONo'] as String? ?? '',
      ReceptionDTimeUTC: json['ReceptionDTimeUTC'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      CustomerPhoneNo: json['CustomerPhoneNo'] as String? ?? '',
      CustomerAddress: json['CustomerAddress'] as String? ?? '',
      AgentCode: json['AgentCode'] as String? ?? '',
      RODesc: json['RODesc'] as String? ?? '',
      Deadline: json['Deadline'] as String? ?? '',
      ProductCode: json['ProductCode'] as String? ?? '',
      SerialNo: json['SerialNo'] as String? ?? '',
      FactoryCode: json['FactoryCode'] as String? ?? '',
      ErrorTypeCode: json['ErrorTypeCode'] as String? ?? '',
      ROStatus: json['ROStatus'] as String? ?? '',
      AppointmentDTimeUTC: json['AppointmentDTimeUTC'] as String?,
      Remark: json['Remark'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrgID': OrgID,
      'RONo': RONo,
      'ReceptionDTimeUTC': ReceptionDTimeUTC,
      'CustomerCodeSys': CustomerCodeSys,
      'CustomerName': CustomerName,
      'CustomerPhoneNo': CustomerPhoneNo,
      'CustomerAddress': CustomerAddress,
      'AgentCode': AgentCode,
      'RODesc': RODesc,
      'Deadline': Deadline,
      'ProductCode': ProductCode,
      'SerialNo': SerialNo,
      'FactoryCode': FactoryCode,
      'ErrorTypeCode': ErrorTypeCode,
      'ROStatus': ROStatus,
      'AppointmentDTimeUTC': AppointmentDTimeUTC,
      'Remark': Remark,
    };
  }
}