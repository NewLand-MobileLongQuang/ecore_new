import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../fake_data/fake_response.dart';

part 'search_condition_state.dart';

class SearchConditionsCubit extends Cubit<SearchConditionsState> {
  SearchConditionsCubit() : super(SearchConditionsInitial());

  List<int> selectedIndexes = [];
  String? currentUsername;
  String? currentModule;
  String? currentFunction;
  List<AdsearchContact> Listfirst = AFake.listContact;

  Future<void> loadContacts(String module, String function) async {
    currentUsername = getCachedEmail() as String?;
    try {
      emit(SearchConditionsLoading());

      final prefs = await SharedPreferences.getInstance();
      final cacheKey = 'selected_contacts_${currentUsername}_${module}_${function}';
      final selectedIds = prefs.getStringList(cacheKey);
      print("LONGLQ1: ${selectedIds?.length}");

      var localData = '';
      if (selectedIds != null) {
        for (var i = 0; i < selectedIds.length; i++) {
          localData += selectedIds[i];
        }
      }

      var contacts = List<AdsearchContact>.from(AFake.listContact);


      if (localData.isNotEmpty) {
        contacts.removeWhere((contact) => localData.contains(contact.ColCaption));
      }

      contacts = contacts.where((contact) => contact.ColGrpCodeSys == 'COLGRPCODESYS.2023.01').toList();

      selectedIndexes.clear();
      for (var i = 0; i < contacts.length; i++) {
        if (contacts[i].FlagActive == '1') {
          selectedIndexes.add(1);
        } else {
          selectedIndexes.add(0);
        }
      }
      emit(SearchConditionsLoaded(contacts));
    } catch (e) {
      emit(SearchConditionsError(e.toString()));
    }
  }
  Future<String?> getCachedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('cached_email');
  }


  Future<void> saveSelectedContacts(List<AdsearchContact> chooseContacts, String username, String module, String function) async {
    final serializedContacts = chooseContacts.map(jsonEncode).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheKey = 'selected_contacts_${username}_${module}_${function}';
    var selectedIds = prefs.getStringList(cacheKey);
    selectedIds?.addAll(serializedContacts);
    await prefs.setStringList('selected_contacts_${username}_${module}_$function', selectedIds ?? serializedContacts);
  }
}
