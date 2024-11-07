import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../../../../fake_data/fake_response.dart';
import '../../../data/datasource/adsearch_listdataview.dart';

part 'setting_advanced_search_state.dart';

class SettingAdvancedSearchCubit extends Cubit<SettingAdvancedSearchState> {
  SettingAdvancedSearchCubit() : super(SettingAdvancedSearchInitial());

  String? currentUsername;
  String? currentModule;
  String? currentFunction;

  Future<void> loadSavedContacts( String module, String function) async {
    currentUsername =  await getCachedEmail();
    currentModule = module;
    currentFunction = function;
    print("LOG :CHECK ${currentUsername} $currentModule $currentFunction");
    try {
      emit(SettingAdvancedSearchLoading());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? selectedContactsJson = prefs.getStringList('selected_contacts_${currentUsername}_${currentModule}_${currentFunction}');
      print("LOG: CHECK ${selectedContactsJson}");
      if (selectedContactsJson != null && selectedContactsJson.isNotEmpty) {
        List<Map<String, dynamic>> selectedContacts = selectedContactsJson
            .map((contactJson) => jsonDecode(contactJson) as Map<String, dynamic>)
            .toList();
        emit(SettingAdvancedSearchLoaded(selectedContacts));
      } else {
        if (listCacheDefault.containsKey('selected_contacts_${currentUsername}_${currentModule}_${currentFunction}')) {
          List<Map<String, dynamic>> defaultContacts = listCacheDefault['selected_contacts_${currentUsername}_${currentModule}_${currentFunction}']!;
          List<String> defaultContactsJson = defaultContacts.map(jsonEncode).toList();
          await prefs.setStringList('selected_contacts_${currentUsername}_${currentModule}_${currentFunction}', defaultContactsJson);
          emit(SettingAdvancedSearchLoaded(defaultContacts));
        } else {
          emit(SettingAdvancedSearchError('No saved contacts found and no default cache available.'));
        }
      }
    } catch (e) {
      emit(SettingAdvancedSearchError(e.toString()));
    }
  }
  Future<String?> getCachedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('cached_account');
  }

  Future<void> saveContactOrder(
      List<Map<String, dynamic>> contacts,
      List<Map<String, dynamic>> selectedContacts,
  ) async {
    try {
      for(var i = 0; i < selectedContacts.length; i++) {
        contacts.remove(selectedContacts[i]);
      }
      final prefs = await SharedPreferences.getInstance();
      final serializedContacts = contacts.map(jsonEncode).toList();
      for (var i in serializedContacts) print("LONG setting : ${i}");
      await prefs.setStringList('selected_contacts_${currentUsername}_${currentModule}_$currentFunction', serializedContacts);
    } catch (e) {
      emit(SettingAdvancedSearchError(e.toString()));
    }
  }

  Future<void> removeView(int index, List<Map<String, dynamic>> contacts) async {
    contacts.removeAt(index);
    emit(SettingAdvancedSearchLoaded(contacts));
  }


}


