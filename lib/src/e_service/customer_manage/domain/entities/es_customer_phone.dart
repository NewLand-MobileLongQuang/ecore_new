import 'package:equatable/equatable.dart';

class ESCustomerPhone extends Equatable {
  const ESCustomerPhone({required this.CtmPhoneNo});

  final String CtmPhoneNo;

  @override
  List<Object?> get props => [CtmPhoneNo];
}