import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasource/adsearch_listdataview.dart';
import '../../data/models/adsearch_model.dart';
import '../../data/datasource/adsearch_datasource.dart';

part 'advanced_search_state.dart';

class AdvancedSearchCubit extends Cubit<AdvancedSearchState> {
  final ADSearchDataSource dataSource;

  AdvancedSearchCubit({required this.dataSource}) : super(AdvancedSearchInitial());

  String? currentUsername;
  String? currentModule;
  String? currentFunction;

  Future<void> loadSavedContacts(String module, String function) async {
    currentUsername = await getCachedEmail();
    currentModule =module;
    currentFunction=function;
    print("LOG: CHECK :$currentUsername $module ; $function");
    try {
      emit(AdvancedSearchLoading());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? selectedContactsJson = prefs.getStringList('selected_contacts_${currentUsername}_${module}_${function}');

      if (selectedContactsJson != null && selectedContactsJson.isNotEmpty) {
        List<Map<String, dynamic>> selectedContacts = selectedContactsJson
            .map((contactJson) => jsonDecode(contactJson) as Map<String, dynamic>)
            .toList();
        emit(AdvancedSearchLoaded(selectedContacts));
      } else {
        if (listCacheDefault.containsKey('selected_contacts_${currentUsername}_${currentModule}_${currentFunction}')) {
          List<Map<String, dynamic>> defaultContacts = listCacheDefault['selected_contacts_${currentUsername}_${currentModule}_${currentFunction}']!;
          List<String> defaultContactsJson = defaultContacts.map(jsonEncode).toList();
          await prefs.setStringList('selected_contacts_${currentUsername}_${currentModule}_${currentFunction}', defaultContactsJson);
          emit(AdvancedSearchLoaded(defaultContacts));
        } else {
          emit(AdvancedSearchError('No saved contacts found and no default cache available.'));
        }
      }
    } catch (e) {
      emit(AdvancedSearchError(e.toString()));
    }
  }

  Future<String?> getCachedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('cached_account');
  }

  Future<void> fetchAdvancedSearch1(String params) async {
    try {
      emit(AdvancedSearchLoading());
      final searchResult = await dataSource.getAdvancedSearch(params: params);
      print("LOGGGGG ${searchResult}");
      if (searchResult.objResult != null) {
        emit(AdvancedSearchLoaded(searchResult.objResult!.dataList.cast<Map<String, dynamic>>()));
      } else {
        emit(AdvancedSearchError("No data available"));
      }
    } catch (e) {
      emit(AdvancedSearchError(e.toString()));
    }
  }
}
