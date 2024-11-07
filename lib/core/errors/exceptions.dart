import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception {
  const ApiException(
      {required this.Message, this.Code='', this.Detail = ''});

  final String? Message;
  final String? Code;
  final String? Detail;

  @override
  List<Object?> get props => [Code, Message, Detail];
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.Message, this.Code='', this.Detail = ''});

  final String? Message;
  final String? Code;
  final String? Detail;

  @override
  List<Object?> get props => [Code, Message, Detail];
}
