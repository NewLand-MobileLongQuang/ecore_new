import 'package:equatable/equatable.dart';

class CallLog extends Equatable {
  const CallLog(
      {required this.Id,
      required this.Type,
      required this.Status,
      required this.RemoteNumber,
      required this.AgentDesc,
      required this.CustomerDesc,
      required this.Extension,
      required this.Description,
      required this.RecFilePath,
      required this.Date,
      required this.Time,
      required this.TalkTime,
      //required this.CreateDTime
      });

  final int Id;

  final String? Type;

  final String? Status;

  final String? RemoteNumber;

  final String? AgentDesc;

  final String? CustomerDesc;

  final String? Extension;

  final String? Description;

  final String? RecFilePath;

  final String? Date;

  final String? Time;

  final int? TalkTime;

 // final DateTime? CreateDTime;

  @override
  List<Object?> get props => [
        Id,
        Type,
        Status,
        RemoteNumber,
        AgentDesc,
        CustomerDesc,
        Extension,
        Description,
        RecFilePath,
        Date,
        Time,
        TalkTime,
        //CreateDTime
      ];
}
