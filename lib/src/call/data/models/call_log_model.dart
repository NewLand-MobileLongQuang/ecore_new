import 'dart:convert';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/call_log.dart';

class CallLogModel extends CallLog {
  const CallLogModel(
      {required super.Id,
      required super.Type,
      required super.Status,
      required super.RemoteNumber,
      required super.AgentDesc,
      required super.CustomerDesc,
      required super.Extension,
      required super.Description,
      required super.RecFilePath,
      required super.Date,
      required super.Time,
      required super.TalkTime,
      //required super.CreateDTime
      });

  CallLogModel.fromMap(DataMap map)
      : this(
          Id: map['Id'] as int,
          Type: map['Type'] as String?,
          Status: map['Status'] as String?,
          RemoteNumber: map['RemoteNumber'] as String?,
          AgentDesc: map['AgentDesc'] as String?,
          CustomerDesc: map['CustomerDesc'] as String?,
          Extension: map['Extension'] as String?,
          Description: map['Description'] as String?,
          RecFilePath: map['RecFilePath'] as String?,
          Date: map['Date'] as String?,
          Time: map['Time'] as String?,
          TalkTime: map['TalkTime'] as int?,
          //CreateDTime:  map['CreateDTime'] !=null ? DateTime.parse(map['CreateDTime'] as String) : null,
        );

  DataMap toMap() => {
        'Id': Id,
        'Type': Type,
        'Status': Status,
        'RemoteNumber': RemoteNumber,
        'AgentDesc': AgentDesc,
        'CustomerDesc': CustomerDesc,
        'Extension': Extension,
        'Description': Description,
        'RecFilePath': RecFilePath,
        'Date': Date,
        'Time': Time,
        'TalkTime': TalkTime,
        //'CreateDTime': CreateDTime,
      };

  factory CallLogModel.fromJson(String source) =>
      CallLogModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  CallLogModel copyWith({
    int? Id,
    String? Type,
    String? Status,
    String? RemoteNumber,
    String? AgentDesc,
    String? CustomerDesc,
    String? Extension,
    String? Description,
    String? RecFilePath,
    String? Date,
    String? Time,
    int? TalkTime,
    DateTime? CreateDTime,
  }) {
    return CallLogModel(
      Id: Id ?? this.Id,
      Type: Type ?? this.Type,
      Status: Status ?? this.Status,
      RemoteNumber: RemoteNumber ?? this.RemoteNumber,
      AgentDesc: AgentDesc ?? this.AgentDesc,
      CustomerDesc: CustomerDesc ?? this.CustomerDesc,
      Extension: Extension ?? this.Extension,
      Description: Description ?? this.Description,
      RecFilePath: RecFilePath ?? this.RecFilePath,
      Date: Date ?? this.Date,
      Time: Time ?? this.Time,
      TalkTime: TalkTime ?? this.TalkTime,
      //CreateDTime: CreateDTime ?? this.CreateDTime,
    );
  }
}
