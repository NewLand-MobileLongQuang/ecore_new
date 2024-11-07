import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/src/e_service/advanced_search/presentation/cubit/advanced_search_cubit.dart' show AdvancedSearchCubit;
import 'package:ecore/src/e_service/advanced_search/setting_advanced_search/presentation/cubit/setting_advanced_search_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingAdvancedSearchScreen extends StatefulWidget {
  final String function;
  final String module;
  const SettingAdvancedSearchScreen({required this.function,
    required this.module,super.key});

  static const routeName = '/setting-advanced-search';

  @override
  State<SettingAdvancedSearchScreen> createState() => _SettingAdvancedSearchState();
}

class _SettingAdvancedSearchState extends State<SettingAdvancedSearchScreen> {

  String currentUsername = "0317844394@inos.vn";
  late String currentModule  ;
  late String currentFunction ;

  List<Map<String, dynamic>> selectedContacts = [];

  @override
  void initState() {
    currentFunction = widget.function;
    currentModule = widget.module;
    super.initState();
    context.read<SettingAdvancedSearchCubit>().loadSavedContacts( currentModule, currentFunction);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    currentFunction = args?['function'] as String;
    currentModule = args?['module'] as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () async {
            final result = Navigator.of(context).maybePop();
            if (result == true) {
              await context.read<AdvancedSearchCubit>().loadSavedContacts(currentModule, currentFunction);
            }
          },
        ),
        title: _textTitle(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () async {
              final cubit = BlocProvider.of<SettingAdvancedSearchCubit>(context);
              if (cubit.state is SettingAdvancedSearchLoaded) {
                cubit.saveContactOrder((cubit.state as SettingAdvancedSearchLoaded).selectedContacts, selectedContacts);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Đã lưu thay đổi'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
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
              Expanded(child: _listSettingAdSearch(context)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buttonAdd(context,currentFunction,currentModule),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textTitle() {
    return const Text(
      'Tùy chỉnh',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      maxLines: 2,
    );
  }

  Widget _listSettingAdSearch(BuildContext context) {
    return BlocConsumer<SettingAdvancedSearchCubit, SettingAdvancedSearchState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if (state is SettingAdvancedSearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SettingAdvancedSearchError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is SettingAdvancedSearchLoaded) {
          return ReorderableListView(
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = state.selectedContacts.removeAt(oldIndex);
                state.selectedContacts.insert(newIndex, item);
              });
              _updateOrderIdx(state.selectedContacts);
            },
            children: state.selectedContacts.asMap().entries.map((entry) {
              final index = entry.key;
              final contact = entry.value;
              return Container(
                key: Key('$index'),
                child: Row(
                  children: [
                    SvgPicture.asset(AppMediaRes.iconMove),
                    const SizedBox(width: 8),
                    Expanded(child: Text(contact['ColCaption'].toString())),
                    IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.buttonRedColor,
                      ),
                      onPressed: () {
                        selectedContacts.add(contact);
                        context.read<SettingAdvancedSearchCubit>().removeView(index, state.selectedContacts);
                      },
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buttonAdd(BuildContext context,String module,String function) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () async {
            final result = Navigator.pushNamed(context, '/search-conditions',
                arguments: {
                  'function': module,
                  'module': function
                });
            if (result == true) {
              await context.read<SettingAdvancedSearchCubit>().loadSavedContacts( module, function);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
          child: const Text('  Thêm điều kiện tìm kiếm  ',style: TextStyle(color: Colors.white,)),
        ),
      ],
    );
  }

  void _updateOrderIdx(List<Map<String, dynamic>> contacts) async {
    // Cập nhật lại OrderIdx và lưu vào SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cacheKey = 'selected_contacts_${currentUsername}_${currentModule}_${currentFunction}';
    final serializedContacts = contacts.map((contact) => jsonEncode(contact)).toList();
    await prefs.setStringList(cacheKey, serializedContacts);
  }
}
