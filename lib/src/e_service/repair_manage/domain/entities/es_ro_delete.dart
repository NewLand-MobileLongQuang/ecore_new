import 'package:equatable/equatable.dart';

class ES_RODelete extends Equatable {
  ES_RODelete({required this.RONO, required this.OrgID});

  final String RONO;
  final String OrgID;

  @override
  List<Object> get props => [RONO, OrgID];
}