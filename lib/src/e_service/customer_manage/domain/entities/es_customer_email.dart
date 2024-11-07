import 'package:equatable/equatable.dart';

class ESCustomerEmail extends Equatable {
  const ESCustomerEmail({required this.CtmEmail});

  final String CtmEmail;

  @override
  List<Object?> get props => [CtmEmail];
}