part of 'search_conditions_cubit.dart';

@immutable
abstract class SearchConditionsState {}

class SearchConditionsInitial extends SearchConditionsState {}

class SearchConditionsLoading extends SearchConditionsState {}

class SearchConditionsLoaded extends SearchConditionsState {
  final List<AdsearchContact> listcontacts;

  SearchConditionsLoaded(this.listcontacts);
}

class SearchConditionsError extends SearchConditionsState {
  final String message;

  SearchConditionsError(this.message);
}
