import 'package:equatable/equatable.dart';

class ES_WarrantyInstall extends Equatable {
  ES_WarrantyInstall({required this.name, required this.installDate, required this.installTime, required this.expiredDate, required this.note});

  final String name;
  final String installDate;
  String installTime;
  String expiredDate;
  String note;

  @override
  List<Object?> get props => [name, installDate, installTime, expiredDate, note];
}