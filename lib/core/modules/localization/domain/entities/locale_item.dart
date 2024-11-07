import 'package:equatable/equatable.dart';

class LocaleItem extends Equatable {
  const LocaleItem({required this.key, required this.value});

  final String key;

  final String value;

  @override
  List<Object?> get props => [key];
}
