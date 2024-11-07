class ObjectResult {
  ObjectResult({
    required this.SolutionCode,
    required this.NetworkID,
    required this.NetworkName,
    required this.GroupNetworkID,
    required this.CoreAddr,
    required this.PingAddr,
    required this.XSysAddr,
    required this.WSUrlAddr,
    required this.WSUrlAddrLAN,
    required this.DBUrlAddr,
    required this.DefaultVersion,
    required this.MinVersion,
    required this.FlagActive,
    required this.LogLUDTime,
    required this.LogLUBy,
  });

  final String SolutionCode;
  final String NetworkID;
  final String NetworkName;
  final String GroupNetworkID;
  final String? CoreAddr;
  final String? PingAddr;
  final String? XSysAddr;
  final String WSUrlAddr;
  final String WSUrlAddrLAN;
  final String? DBUrlAddr;
  final String DefaultVersion;
  final String MinVersion;
  final String FlagActive;
  final String LogLUDTime;
  final String LogLUBy;
}