import 'package:equatable/equatable.dart';

class RQ_ES_Customer extends Equatable {
  RQ_ES_Customer({required this.CustomerCode, required this.CustomerName, required this.CustomerAddress, required this.CustomerPhoneNo, required this.CustomerEmail});

  final String CustomerCode;
  final String CustomerName;
  final String CustomerAddress;
  final String CustomerPhoneNo;
  final String CustomerEmail;


  @override
  List<Object?> get props => [CustomerCode, CustomerName, CustomerAddress, CustomerPhoneNo, CustomerEmail];
}