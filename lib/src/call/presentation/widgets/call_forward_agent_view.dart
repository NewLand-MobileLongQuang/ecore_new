import 'package:ecore/core/utils/core_utils.dart';
import 'package:ecore/src/call/domain/usecases/redirect_current_call.dart';
import 'package:ecore/src/call/presentation/cubit/call_forward_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/res/colors.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/services/injection_container.dart';
import '../../../../fake_data/person_contact.dart';
import '../../domain/entities/agent.dart';

class CallForwardAgentView extends StatefulWidget {
  const CallForwardAgentView({super.key, required this.dataList});

  final List<Agent> dataList;
  @override
  State<CallForwardAgentView> createState() => _CallForwardAgentViewState();
}

class _CallForwardAgentViewState extends State<CallForwardAgentView> {
  List<Agent> get listItems => widget.dataList;
  List<Agent> newListItems = [];
  var searchHistory = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    queryListener();
    searchController.addListener(queryListener);
    super.initState();
  }

  void queryListener() {
    search(searchController.text);
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        newListItems = listItems;
      });
    } else {
      setState(() {
        newListItems = listItems
            .where((element) =>
                element.Name!.toLowerCase().contains(query.toLowerCase()) ||
                (element.Alias != null && element.Alias!.contains(query)))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    searchController
      ..removeListener(queryListener)
      ..dispose();
    super.dispose();
  }

  void confirmForward(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28.0))),
          title: Text(
            'Thông báo',
            style: AppTextStyles.textStyleInterW400S24Black,
          ),
          content: Text(
              'Cuộc gọi sẽ được chuyển đến Agent ${newListItems[index].Name}',
              style: AppTextStyles.textStyleInterW400S14Grey),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();


             //   method(newListItems[index].ExtId.toString());

              },
              child: Text(
                'cancel',
                style: AppTextStyles.textStyleInterW500S14Primary,
              ),
            ),
            TextButton(
              onPressed: () async {
                //Navigator.of(context).pop();
                final result= await sl<RedirectCurrentCall>()(newListItems[index].ExtId.toString());

                result.fold((l) {
                  CoreUtils.showSnackBar(context, l.Message??'');
                  Navigator.of(context).pop();

                }, (r) {
                  CoreUtils.showSnackBar(context, 'Cuộc gọi đã chuyển');
                  Navigator.of(context).pop();
                });
              },

              child: Text(
                'Ok',
                style: AppTextStyles.textStyleInterW500S14Primary,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SearchBar(
            controller: searchController,
            hintText: 'Nhập tên, số máy lẻ',
            trailing: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColors.textGreyColor,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: MaterialStateProperty.all(AppColors.primaryOpa11),
            elevation: MaterialStateProperty.all(0),
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              final contact = listItems[index];
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        newListItems[index].Name ?? '',
                        style: AppTextStyles.textStyleInterW400S16Black,
                      ),
                      Text(
                        newListItems[index].Alias ?? '',
                        style: AppTextStyles.textStyleInterW400S14Black,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      confirmForward(context, index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        'Chuyển',
                        style: AppTextStyles.textStyleInterW400S11White,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: AppColors.divideColor,
            ),
            itemCount: newListItems.length,
          )),
        ],
      ),
    );
  }
}
