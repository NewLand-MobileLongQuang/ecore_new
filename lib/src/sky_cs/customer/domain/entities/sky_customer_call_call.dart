import 'package:equatable/equatable.dart';

class SKY_CustomerCallCall extends Equatable {
  const SKY_CustomerCallCall({required this.CallId, required this.NetworkID, required this.OrgID, required this.CustomerCodeSys, required this.CallType, required this.ExtId, required this.AgentUserId, required this.RemoteNumber, required this.State, required this.FromExtId, required this.ToExtId, required this.FromNumber, required this.ToNumber, required this.HoldTime, required this.RingTime, required this.WaitTime, required this.TalkTime, required this.TalkDTime, required this.StartDTime, required this.EndReason, required this.RecFilePath, required this.RecFilePathFull, required this.FromUserId, required this.FromUserCode, required this.ToUserId, required this.ToUserCode, required this.CreateDTimeUTC, required this.CreateBy, required this.LUDTimeUTC, required this.LUBy, required this.LogLUDTimeUTC, required this.LogLUBy, required this.Json_Call_CallBizRef, required this.sut_UserCode, required this.sut_UserName, required this.suf_UserCode, required this.suf_UserName, required this.suag_UserCode, required this.suag_UserName, required this.CustomerName, required this.AudioId, required this.AudioName, required this.TalkTimeToMinutes, required this.AudioAnalysisStatus});

  final String CallId;
  final String NetworkID;
  final String OrgID;
  final String CustomerCodeSys;
  final String CallType;
  final String ExtId;
  final String AgentUserId;
  final String RemoteNumber;
  final String State;
  final String FromExtId;
  final String ToExtId;
  final String FromNumber;
  final String ToNumber;
  final int HoldTime;
  final int RingTime;
  final int WaitTime;
  final int TalkTime;
  final String TalkDTime;
  final String StartDTime;
  final String EndReason;
  final String RecFilePath;
  final String RecFilePathFull;
  final String FromUserId;
  final String FromUserCode;
  final String ToUserId;
  final String ToUserCode;
  final String CreateDTimeUTC;
  final String CreateBy;
  final String LUDTimeUTC;
  final String LUBy;
  final String LogLUDTimeUTC;
  final String LogLUBy;
  final String Json_Call_CallBizRef;
  final String sut_UserCode;
  final String sut_UserName;
  final String suf_UserCode;
  final String suf_UserName;
  final String suag_UserCode;
  final String suag_UserName;
  final String CustomerName;
  final String AudioId;
  final String AudioName;
  final double TalkTimeToMinutes;
  final String AudioAnalysisStatus;

  @override
  List<Object?> get props => [
    CallId,
    NetworkID,
    OrgID,
    CustomerCodeSys,
    CallType,
    ExtId,
    AgentUserId,
    RemoteNumber,
    State,
    FromExtId,
    ToExtId,
    FromNumber,
    ToNumber,
    HoldTime,
    RingTime,
    WaitTime,
    TalkTime,
    TalkDTime,
    StartDTime,
    EndReason,
    RecFilePath,
    RecFilePathFull,
    FromUserId,
    FromUserCode,
    ToUserId,
    ToUserCode,
    CreateDTimeUTC,
    CreateBy,
    LUDTimeUTC,
    LUBy,
    LogLUDTimeUTC,
    LogLUBy,
    Json_Call_CallBizRef,
    sut_UserCode,
    sut_UserName,
    suf_UserCode,
    suf_UserName,
    suag_UserCode,
    suag_UserName,
    CustomerName,
    AudioId,
    AudioName,
    TalkTimeToMinutes,
    AudioAnalysisStatus,
  ];
}