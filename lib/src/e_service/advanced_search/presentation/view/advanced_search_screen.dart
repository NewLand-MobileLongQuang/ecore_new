import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/inputs/i_select_date.dart';
import '../../../../../core/common/widgets/inputs/i_select_field.dart';
import '../../../../../core/common/widgets/inputs/i_text_field.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/text_styles.dart';
import '../cubit/advanced_search_cubit.dart';

class AdvancedSearchScreen extends StatefulWidget {
  final String function;
  final String module;
  const AdvancedSearchScreen({
    required this.function,
    required this.module,Key? key}) : super(key: key);

  static const routeName = '/advanced-search';

  @override
  State<AdvancedSearchScreen> createState() => _AdvancedSearchState();
}

class _AdvancedSearchState extends State<AdvancedSearchScreen> {


  TextEditingController _textEditingController = TextEditingController();
  String _selectedDropdownValue = '';
  DateTime? _selectedDate;
  late String currentModule ;
   late String currentFunction ;


  @override
  void initState() {
    currentFunction = widget.function;
    currentModule = widget.module;
    super.initState();
    context.read<AdvancedSearchCubit>().loadSavedContacts( currentModule, currentFunction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textWhiteColor,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: _textTitle(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.task_alt,
              color: AppColors.textWhiteColor,
            ),
            onPressed: () async {
              _saveInputs();
              //final result = await Navigator.pushNamed(context, '/setting-advanced-search');
              //if (result == true) {
              //  await context.read<AdvancedSearchCubit>().loadSavedContacts(currentUsername, currentModule, currentFunction);
              //  _restoreInputs();
              //}
            },
          ),
          PopupMenuButton(
            icon: const Icon(
              Icons.pending,
              color: AppColors.textGreenColor,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Tùy chỉnh'),
                onTap: () async {
                  _saveInputs();
                  final result = await Navigator.pushNamed(context, '/setting-advanced-search',
                      arguments: {
                        'function': currentFunction,
                        'module': currentModule
                      });
                  if (result == true) {
                    await context.read<AdvancedSearchCubit>().loadSavedContacts(currentModule, currentFunction);
                    _restoreInputs();
                  }
                },
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _listAdvancedsearch(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      'Tìm kiếm nâng cao',
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _listAdvancedsearch(BuildContext context) {
    return Expanded(
      child: BlocConsumer<AdvancedSearchCubit, AdvancedSearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AdvancedSearchLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AdvancedSearchError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is AdvancedSearchLoaded) {
            print(state.dataList.length);
            return ListView.builder(
              itemCount: state.dataList.length,
              itemBuilder: (context, index) {
                final item = state.dataList[index];
                final colCaption = (item['ColCaption'] ?? '') as String;
                final colDataType = (item['ColDataType'] ?? '') as String;
                final sqlOperatorType = (item['SqlOperatorType'] ?? '') as String;
                final mdmcJsonListOption = (item['mdmc_JsonListOption'] ?? '') as String;

                return _item(
                  title: colCaption,
                  value: '',
                  dataType: colDataType,
                  optionsJson: mdmcJsonListOption,
                );
              },
            );
          }

          return SizedBox();
        },
      ),
    );
  }

  Widget _item({required String title, required String value, required String dataType, required String optionsJson, int? maxLine}) {
    if (dataType == 'TEXT') {
      _textEditingController.text = value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.greyLightColor,
            ),
            child: ITextField(
              controller: _textEditingController,
              readOnly: false,
              hintText: "Nhập",
              hintStyle: AppTextStyles.textStyleInterW400S14Black,
              label: title,
              maxLines: maxLine,
            ),
          )
        ],
      );
    } else if (dataType == 'SELECTONEDROPDOWN') {
      List<dynamic> options = jsonDecode(optionsJson) as List<dynamic>;
      options.sort((a, b) => (a['OrderIdx'] as int).compareTo(b['OrderIdx'] as int));
      List<String> values = options.map((option) => option['Value'] as String).toList();

      if (!values.contains(value)) {
        _selectedDropdownValue = values.isNotEmpty ? values.first : '';
      } else {
        _selectedDropdownValue = value;
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.greyLightColor,
            ),
            // child: ISelectField<String>(
            //   hintText: title,
            //   options: values,
            //   getLabel: (option) => option,
            //   value: _selectedDropdownValue,
            //   onChanged: (newValue) {
            //     setState(() {
            //       _selectedDropdownValue = newValue ?? '';
            //     });
            //     // Handle value change if needed
            //   },
            // ),
          )
        ],
      );
    } else if (dataType == 'DATE') {
      _selectedDate = null; // Khôi phục giá trị cho DatePicker
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.greyLightColor,
            ),
            child: DatePickerField(
              hintText: title,
              controller: _textEditingController,
            ),
          )
        ],
      );
    }
    return SizedBox();
  }


  void _saveInputs() {

  }

  void _restoreInputs() {

  }
}
