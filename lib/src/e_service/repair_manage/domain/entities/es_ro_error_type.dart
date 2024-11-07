import 'package:equatable/equatable.dart';

class ES_ROErrorType extends Equatable {
  final String OrgID;
  final String ErrorTypeCode;
  final String NetworkID;
  final String ErrorTypeName;
  final String ErrorTypeDesc;
  final String NetworkErrorTypeCode;
  final String FlagActive;
  final String DTimeUsed;
  final String LogLUDTimeUTC;
  final String LogLUBy;

  ES_ROErrorType({
    required this.OrgID,
    required this.ErrorTypeCode,
    required this.NetworkID,
    required this.ErrorTypeName,
    required this.ErrorTypeDesc,
    required this.NetworkErrorTypeCode,
    required this.FlagActive,
    required this.DTimeUsed,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  @override
  List<Object?> get props => [
    OrgID,
    ErrorTypeCode,
    NetworkID,
    ErrorTypeName,
    ErrorTypeDesc,
    NetworkErrorTypeCode,
    FlagActive,
    DTimeUsed,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}