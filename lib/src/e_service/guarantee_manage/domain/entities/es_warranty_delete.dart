import 'package:equatable/equatable.dart';

class ES_WarrantyDelete extends Equatable {
  const ES_WarrantyDelete({
    required this.WarrantyNo,
    required this.OrgID,
  });

  final String WarrantyNo;
  final String OrgID;

  @override
  List<Object> get props => [WarrantyNo, OrgID];
}