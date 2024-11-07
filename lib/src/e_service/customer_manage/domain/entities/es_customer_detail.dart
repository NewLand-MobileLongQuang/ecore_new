import 'package:equatable/equatable.dart';

class ESCustomerDetail extends Equatable {
  const ESCustomerDetail({required this.CustomerCode, required this.CustomerName, required this.CustomerAddress, required this.CustomerAvatarPath});

  final String CustomerCode;
  final String CustomerName;
  final String CustomerAddress;
  final String CustomerAvatarPath;

  @override
  List<Object?> get props => [CustomerCode, CustomerName, CustomerAddress, CustomerAvatarPath];
}