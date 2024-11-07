import 'package:equatable/equatable.dart';

class ES_Customer extends Equatable{
  ES_Customer({required this.CustomerCodeSys, required this.CustomerCode, required this.CustomerName, required this.CustomerPhoneNo, required this.CustomerEmail, required this.CustomerAddress, required this.CustomerAvatarPath});

  final String CustomerCodeSys;
  String CustomerCode;
  String CustomerName;
  String CustomerPhoneNo;
  String CustomerEmail;
  String CustomerAddress;
  final String CustomerAvatarPath;

  @override
  List<Object?> get props => [CustomerCodeSys, CustomerCode, CustomerName, CustomerPhoneNo, CustomerEmail, CustomerAddress, CustomerAvatarPath];

}