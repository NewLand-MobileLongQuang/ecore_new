import 'package:equatable/equatable.dart';

class InosUser extends Equatable {

  InosUser({
    required this.Id,
    required this.Email,
    required this.Name,
    required this.Phone,
    required this.Language,
    required this.Avatar,
  });


  final int Id;
  final String? Email;
  String? Name;
  final String? Phone;
  final String? Language;
  final String? Avatar;
  final int TimeZone=7;

  @override

  List<Object?> get props => [Id, Name, Email, Phone, Language];
}
