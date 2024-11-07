
import '../../../../utils/typedef.dart';
import '../../domain/entities/object_result.dart';

class ObjectResultModel extends ObjectResult {
  ObjectResultModel({
    required super.SolutionCode,
    required super.NetworkID,
    required super.NetworkName,
    required super.GroupNetworkID,
    required super.CoreAddr,
    required super.PingAddr,
    required super.XSysAddr,
    required super.WSUrlAddr,
    required super.WSUrlAddrLAN,
    required super.DBUrlAddr,
    required super.DefaultVersion,
    required super.MinVersion,
    required super.FlagActive,
    required super.LogLUDTime,
    required super.LogLUBy,
  });

  factory ObjectResultModel.fromJson(DataMap map) {
    return ObjectResultModel(
      SolutionCode: map['SolutionCode'] as String,
      NetworkID: map['NetworkID'] as String,
      NetworkName: map['NetworkName'] as String,
      GroupNetworkID: map['GroupNetworkID'] as String,
      CoreAddr: map['CoreAddr'] as String? ?? '',
      PingAddr: map['PingAddr'] as String? ?? '',
      XSysAddr: map['XSysAddr'] as String? ?? '',
      WSUrlAddr: map['WSUrlAddr'] as String,
      WSUrlAddrLAN: map['WSUrlAddrLAN'] as String,
      DBUrlAddr: map['DBUrlAddr'] as String? ?? '',
      DefaultVersion: map['DefaultVersion'] as String,
      MinVersion: map['MinVersion'] as String,
      FlagActive: map['FlagActive'] as String,
      LogLUDTime: map['LogLUDTime'] as String,
      LogLUBy: map['LogLUBy'] as String,
    );
  }
}