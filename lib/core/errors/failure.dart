import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {

  const Failure({required this.Code, required this.Message});
  final String? Message;
  final String? Code;

  @override

  List<Object?> get props => [Code, Message];

}
class ApiFailure extends Failure
{
  const ApiFailure({required super.Code, required super.Message});

  ApiFailure.fromException(ApiException exception): this(Message: exception.Message, Code: exception.Code);
}

class CacheFailure extends Failure
{
  const CacheFailure({required super.Code, required super.Message});

  CacheFailure.fromException(CacheException exception): this(Message: exception.Message, Code: exception.Code);
}
