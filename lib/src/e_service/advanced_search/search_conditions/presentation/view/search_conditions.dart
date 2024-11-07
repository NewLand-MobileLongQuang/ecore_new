import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/res/colors.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../fake_data/fake_response.dart';
import '../../../setting_advanced_search/presentation/cubit/setting_advanced_search_cubit.dart';
import '../cubit/search_conditions_cubit.dart';

class SearchConditionsScreen extends StatefulWidget {
  final String function;
  final String module;
  const SearchConditionsScreen({
    required this.function,
    required this.module,
    super.key}
      );

  static const routeName = '/search-conditions';

  @override
  State<SearchConditionsScreen> createState() => _SearchConditionsState();
}

class _SearchConditionsState extends State<SearchConditionsScreen> {
  final TextEditingController _searchConditionController = TextEditingController();
  String currentUsername = '0317844394@inos.vn';
  late String currentModule;
  late String currentFunction;

  late List<bool> checked;
  bool _selectAll = false;
  List<AdsearchContact> chooseContacts = [];
  List<AdsearchContact> listContacts = [];
  @override
  void initState() {
    currentFunction = widget.function;
    currentModule = widget.module;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SearchConditionsCubit()..loadContacts(currentModule, currentFunction),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.textWhiteColor,
            ),
            onPressed: () async {
              final result = Navigator.of(context).maybePop();
              if (result == true) {
                await context.read<SettingAdvancedSearchCubit>().loadSavedContacts( currentModule, currentFunction);
              }

            },
          ),
          title: _textTitle(),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.save,
                color: AppColors.textWhiteColor,
              ),
              onPressed: () {
                context.read<SearchConditionsCubit>().saveSelectedContacts(
                    chooseContacts.toSet().toList(),
                    currentUsername,
                    currentModule,
                    currentFunction,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saved selected contacts')),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchBar(),
                const SizedBox(height: 5,),
                _selectAllCheckBox(),
                _listConditions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchConditionController,
            onChanged: (value) {
            },
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              filled: true,
              fillColor: Colors.green[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textTitle() {
    return Text(
      'Điều kiện tìm kiếm',
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _listConditions(BuildContext context) {
    return Expanded(
      child: BlocConsumer<SearchConditionsCubit, SearchConditionsState>(
          listener: (context, state) {
            if (state is SearchConditionsLoaded) {
              checked = List.filled(state.listcontacts.length, false);
              listContacts = state.listcontacts;
            }
          },
          builder: (context, state) {
            if (state is SearchConditionsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SearchConditionsError) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is SearchConditionsLoaded) {
              return ListView.builder(
                itemCount: state.listcontacts.length,
                itemBuilder: (context, index) {
                  final contact = state.listcontacts[index];
                  return CheckboxListTile(
                    key: Key(contact.ColCode),
                    title: Text(contact.ColCaption),
                    value: checked[index],
                    onChanged: (value) {
                      int dem = 0;
                      setState(() {
                        if(checked[index] == true){
                          checked[index] = false;
                          chooseContacts.remove(contact);
                        } else {
                          checked[index] = true;
                          chooseContacts.add(contact);
                        }
                        for(var i = 0; i < checked.length; i++) {
                          if (checked[i] == true) {
                            dem++;
                          }
                        }
                        if(dem == checked.length){
                          _selectAll = true;
                        } else {
                          _selectAll = false;
                        }
                      });
                    },
                  );
                },
              );
            }
            return const SizedBox();
          },
        )
    );
  }

  Widget _selectAllCheckBox() {
    return CheckboxListTile(
      title: const Text('Chọn tất cả'),
      value: _selectAll,
      onChanged: (value) async {
        setState(() {
          if(_selectAll == true){
            _selectAll = false;
            checked = List.filled(checked.length, false);
            chooseContacts.clear();
          } else {
            _selectAll = true;
            checked = List.filled(checked.length, true);
            chooseContacts.clear();
            chooseContacts = listContacts;
          }
        });
      },
    );
  }
}
