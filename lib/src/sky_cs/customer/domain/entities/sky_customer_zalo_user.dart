import 'package:equatable/equatable.dart';

class SKY_CustomerZaloUser extends Equatable {
  SKY_CustomerZaloUser({required this.user_id, required this.user_name, required this.user_gender, required this.user_id_by_app, required this.avatar, required this.display_name});

  final String user_id;
  final String user_name;
  final String user_gender;
  final String user_id_by_app;
  final String avatar;
  final String display_name;

  @override
  List<Object?> get props => [user_id, user_name, user_gender, user_id_by_app, avatar, display_name];
}