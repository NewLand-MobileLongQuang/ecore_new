part of 'setting_advanced_search_cubit.dart';

@immutable
abstract class SettingAdvancedSearchState {}

class SettingAdvancedSearchInitial extends SettingAdvancedSearchState {}

class SettingAdvancedSearchLoading extends SettingAdvancedSearchState {}

class SettingAdvancedSearchLoaded extends SettingAdvancedSearchState {
  final List<Map<String, dynamic>> selectedContacts;

  SettingAdvancedSearchLoaded(this.selectedContacts);
}

class SettingAdvancedSearchError extends SettingAdvancedSearchState {
  final String message;

  SettingAdvancedSearchError(this.message);
}
