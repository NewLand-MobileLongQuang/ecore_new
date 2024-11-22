import 'package:equatable/equatable.dart';

class SKY_ETicket_Mst_Tag extends Equatable {
  SKY_ETicket_Mst_Tag({
    required this.TagID,
    required this.NetworkID,
    required this.TagName,
    required this.TagDesc,
    required this.Slug,
    required this.FlagActive,
    required this.LogLUDTimeUTC,
    required this.LogLUBy,
  });

  final String TagID;
  final String NetworkID;
  final String TagName;
  final String TagDesc;
  final String Slug;
  final String FlagActive;
  final String LogLUDTimeUTC;
  final String? LogLUBy;

  @override
  List<Object?> get props => [
    TagID,
    NetworkID,
    TagName,
    TagDesc,
    Slug,
    FlagActive,
    LogLUDTimeUTC,
    LogLUBy,
  ];
}
