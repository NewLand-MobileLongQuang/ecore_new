import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/views/repair_detail_screen.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/views/repair_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ecore/core/common/widgets/inputs/i_search.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_manage_cubit/repair_manage_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';

class RepairManageScreen extends StatefulWidget {
  const RepairManageScreen({super.key});

  static const routeName = 'repair-manage';

  @override
  State<RepairManageScreen> createState() => _RepairManageScreenState();
}

class _RepairManageScreenState extends State<RepairManageScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<RepairManageCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(RepairManageScreen.routeName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.chevronLeft,
            color: AppColors.textWhiteColor,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: _textTitle(l),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<RepairManageCubit>().init();
        },
        displacement: 15,
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocConsumer<RepairManageCubit, RepairManageState>(
              listener: (context, state) {
                if(state is RepairManageError) {
                  IDialog.showNotificationDialog(context, state.message);
                }
              },
              builder: (context, state) {
                if(state is RepairManageLoading) {
                  return const LoadingView();
                }
                if(state is RepairManageLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchBar(),
                      const SizedBox(height: 16),
                      _listRepair(context, state.list),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _textTitle(LocalizationHelper l) {
    return Text(
      l(AppStrings.roManageTitle),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _searchBar() {
    return ISearch(
      controller: _searchController,
      onChanged: (text) {
        context.read<RepairManageCubit>().search(_searchController.text);
      },
      onSubmitted: (text) {
        context.read<RepairManageCubit>().search(_searchController.text);
      },
    );
  }

  Widget _listRepair(BuildContext context, List<ES_RODetail> listRepair) {
    return Expanded(
      child: ListView.separated(
          itemCount: listRepair.length,
          separatorBuilder: (context, index) => Container(height: 8),
          itemBuilder: (context, index) {
            return _itemRepair(context, listRepair[index]);
          }
      ),
    );
  }

  Widget _itemRepair(BuildContext context, ES_RODetail eS_RODetail) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          EServiceUtils.getFullRouteName(RepairEditScreen.routeName),
          arguments: eS_RODetail.RONo,
        ).then((value) {
          if (value != null && value == true) {
            context.read<RepairManageCubit>().init();
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors.textBlueColor.withOpacity(0.1),
          border: const Border.fromBorderSide(BorderSide(color: AppColors.textBlueColor)),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.6,
            children: [
              SlidableAction(
                onPressed: (context) {
                  context.pushNamed(
                    EServiceUtils.getFullRouteName(RepairEditScreen.routeName),
                    arguments: eS_RODetail.RONo,
                  ).then((value) {
                    if (value != null && value == true) {
                      context.read<RepairManageCubit>().init();
                    }
                  });
                },
                backgroundColor: AppColors.transparent,
                icon: null,
                label: '',
              ),
              Container(
                color: AppColors.transparent,
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pushNamed(
                              EServiceUtils.getFullRouteName(RepairEditScreen.routeName),
                              arguments: eS_RODetail.RONo,
                            ).then((value) {
                              if (value != null && value == true) {
                                context.read<RepairManageCubit>().init();
                              }
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.pencil,
                              size: 16,
                              color: AppColors.textWhiteColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            context.pushNamed(
                              EServiceUtils.getFullRouteName(RepairDetailScreen.routeName),
                              arguments: eS_RODetail.RONo,
                            ).then((value) {
                              if (value != null && value == true) {
                                context.read<RepairManageCubit>().init();
                              }
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: const Center(
                              child: Icon(
                                FontAwesomeIcons.info,
                                size: 16,
                                color: AppColors.textWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
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
              color: AppColors.transparent,
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
                        StringGenerate.getCurrentName(eS_RODetail.CustomerNameReal).toUpperCase(),
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
                              eS_RODetail.CustomerNameReal,
                              style: AppTextStyles.textStyleInterW600S16Primary,
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
                          const SizedBox(width: 8),
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
      ),
    );
  }
}
