import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:ecore/core/common/widgets/inputs/i_search.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';

import 'package:ecore/core/services/injection_container.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_manage_cubit/repair_manage_cubit.dart';

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';

class RepairManageScreen extends StatelessWidget {
  const RepairManageScreen({super.key});

  static const routeName = 'repair-manage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepairManageCubit(searchROUseCase: sl())..init(),
      child: const RepairManageScreenUI(),
    );
  }
}


class RepairManageScreenUI extends StatefulWidget {
  const RepairManageScreenUI({super.key});

  @override
  State<RepairManageScreenUI> createState() => _RepairManageScreenUIState();
}

class _RepairManageScreenUIState extends State<RepairManageScreenUI> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        context.read<RepairManageCubit>().loadMore();
      }
    });
    super.initState();
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
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Navigator.of(context).pushReplacementNamed(RepairManageScreen.routeName);
        },
        displacement: 15,
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchBar(),
                const SizedBox(height: 16),
                _listRepair(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.roManageTitle,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _searchBar() {
    return ISearch(
      controller: _searchController,
      onSubmitted: (text) {
        if(_searchController.text.isEmpty) {
          Navigator.of(context).pushReplacementNamed(RepairManageScreen.routeName);
        }
        else {
          context.read<RepairManageCubit>().search(_searchController.text);
        }
      },
    );
  }

  Widget _listRepair(BuildContext context) {
    return Expanded(
      child: BlocConsumer<RepairManageCubit, RepairManageState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is RepairManageLoading) {
            return const LoadingView();
          }
          if (state is RepairManageError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is RepairManageLoaded) {
            final listRepair = state.list;
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  ListView.separated(
                      itemCount: listRepair.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Container(height: 1, color: AppColors.divideColor,),
                      itemBuilder: (context, index) {
                        return _itemRepair(context, state.list[index]);
                      }
                  ),
                  if(state is RepairManageLoadingMore)...[
                    const LoadingView(),
                  ],
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _itemRepair(BuildContext context, ES_RODetail eS_RODetail) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/repair-edit', arguments: eS_RODetail.RONo)
            .then((value) {
          if (value != null && value == true) {
            context.read<RepairManageCubit>().init();
          };
        });
      },
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.6,
          children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.of(context)
                    .pushNamed('/repair-edit', arguments: eS_RODetail.RONo)
                    .then((value) {
                  if (value != null && value == true) {
                    context.read<RepairManageCubit>().init();
                  };
                });
              },
              backgroundColor: AppColors.textWhiteColor,
              icon: null,
              label: '',
            ),
            Container(
              color: AppColors.textWhiteColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/repair-edit', arguments: eS_RODetail.RONo)
                                .then((value) {
                              if (value != null && value == true) {
                                context.read<RepairManageCubit>().init();
                              };
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 48,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                              color: AppColors.textWhiteColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/repair-detail', arguments: eS_RODetail.RONo)
                                .then((value) {
                              if (value != null && value == true) {
                                context.read<RepairManageCubit>().init();
                              };
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 48,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.perm_device_information,
                                size: 20,
                                color: AppColors.textWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: AppColors.textWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.textWhiteColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(eS_RODetail.CustomerAvatarPath != '')...[
                CircleAvatar(
                  backgroundImage: NetworkImage(eS_RODetail.CustomerAvatarPath),
                ),
              ],
              if(eS_RODetail.CustomerAvatarPath == '')...[
                CircleAvatar(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      StringGenerate.getCurrentName(eS_RODetail.CustomerName).toUpperCase(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
              const SizedBox(width: 8), // Adding space between CircleAvatar and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          Text(
                            eS_RODetail.CustomerName,
                            style: AppTextStyles.textStyleInterW400S16Black,
                          ),
                          Text(
                            ' - ',
                            style: AppTextStyles.textStyleInterW400S14Grey,
                          ),
                          Expanded(
                            child: Text(
                              '(SĐT: ${eS_RODetail.CustomerPhoneNo})',
                              style: AppTextStyles.textStyleInterW400S14Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ]
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            eS_RODetail.CustomerAddress,
                            style: AppTextStyles.textStyleInterW400S14Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          eS_RODetail.ROStatus,
                          style: eS_RODetail.ROStatus == 'FINISH'
                              ? AppTextStyles.textStyleInterW400S14Primary
                              : AppTextStyles.textStyleInterW400S14Red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(child:
                        Text(
                          eS_RODetail.RODesc,
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        ),
                        if(eS_RODetail.AgentAvatar != '')...[
                          CircleAvatar(
                            backgroundImage: NetworkImage(eS_RODetail.AgentAvatar),
                          ),
                        ],
                        if(eS_RODetail.AgentAvatar == '')...[
                          CircleAvatar(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                StringGenerate.getCurrentName(eS_RODetail.AgentName).toUpperCase(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
