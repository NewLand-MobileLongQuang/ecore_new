import 'package:ecore/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/res/colors.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../fake_data/person_contact.dart';
import '../../domain/entities/agent.dart';

class CallInternalAgentView extends StatefulWidget {
  const CallInternalAgentView({super.key, required this.dataList});

  final List<Agent> dataList;
  @override
  State<CallInternalAgentView> createState() => _CallInternalAgentViewState();
}

class _CallInternalAgentViewState extends State<CallInternalAgentView> {
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
              final contact = newListItems[index];
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        contact.Name ?? '',
                        style: AppTextStyles.textStyleInterW400S16Black,
                      ),
                      Text(
                        contact.Alias ?? '',
                        style: AppTextStyles.textStyleInterW400S14Black,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      if (contact.Alias != null) {
                        context.callProvider.helper?.call(contact.Alias!);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          width: 20,
                          height: 16,
                          AppMediaRes.iconCall2,
                        ),
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
