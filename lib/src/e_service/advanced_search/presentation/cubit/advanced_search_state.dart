part of 'advanced_search_cubit.dart';

@immutable
abstract class AdvancedSearchState {}

class AdvancedSearchInitial extends AdvancedSearchState {}

class AdvancedSearchLoading extends AdvancedSearchState {}

class AdvancedSearchLoaded extends AdvancedSearchState {
  final List<Map<String, dynamic>>  dataList;

  AdvancedSearchLoaded(this.dataList);
}

class AdvancedSearchError extends AdvancedSearchState {
  final String message;

  AdvancedSearchError(this.message);
}
