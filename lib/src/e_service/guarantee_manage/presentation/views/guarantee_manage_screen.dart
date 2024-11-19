import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_activate_screen.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_detail_screen.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_search.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_manage_cubit/guarantee_manage_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GuaranteeManageScreen extends StatefulWidget {
  const GuaranteeManageScreen({super.key});

  static const routeName = 'guarantee-manage';

  @override
  State<GuaranteeManageScreen> createState() => _GuaranteeManageScreenState();
}

class _GuaranteeManageScreenState extends State<GuaranteeManageScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmptyData = true;

  @override
  void initState() {
    context.read<GuaranteeManageCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(GuaranteeManageScreen.routeName);

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
          await context.read<GuaranteeManageCubit>().init();
        },
        displacement: 15,
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocConsumer<GuaranteeManageCubit, GuaranteeManageState>(
              listener: (context, state) {
                if (state is GuaranteeManageError) {
                  IDialog.showNotificationDialog(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is GuaranteeManageLoading) {
                  return const LoadingView();
                }
                if(state is GuaranteeManageLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchBar(state.list),
                      const SizedBox(height: 16),
                      _listGuarantee(context, state.list),
                      _buttonAdd(),
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
      l(AppStrings.guaranteeManageTitle),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _searchBar(List<ES_WarrantyDetail> list) {
    return ISearch(
      controller: _searchController,
      onChanged: (text) {
        context.read<GuaranteeManageCubit>().search(_searchController.text);
      },
      onSubmitted: (text) {
        context.read<GuaranteeManageCubit>().search(_searchController.text);
      },
    );
  }

  Widget _listGuarantee(BuildContext context, List<ES_WarrantyDetail> listGuarantee) {
    return Expanded(
      child: ListView.separated(
        itemCount: listGuarantee.length,
        separatorBuilder: (context, index) => Container(height: 8),
        itemBuilder: (context, index) {
          return _itemGuarantee(context, listGuarantee[index]);
        },
      ),
    );
  }

  Widget _itemGuarantee(BuildContext context, ES_WarrantyDetail eS_WarrantyDetail) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          EServiceUtils.getFullRouteName(GuaranteeDetailScreen.routeName),
          arguments: eS_WarrantyDetail.WarrantyNo,
        ).then((value) {
          if (value != null && value == true) {
            context.read<GuaranteeManageCubit>().init();
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors.textYellowColor.withOpacity(0.1),
          border: const Border.fromBorderSide(BorderSide(color: AppColors.textYellowColor)),
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
                    GuaranteeDetailScreen.routeName,
                    arguments: eS_WarrantyDetail.WarrantyNo,
                  ).then((value) {
                    if (value != null && value == true) {
                      context.read<GuaranteeManageCubit>().init();
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
                              GuaranteeDetailScreen.routeName,
                              arguments: eS_WarrantyDetail.WarrantyNo,
                            ).then((value) {
                              if (value != null && value == true) {
                                context.read<GuaranteeManageCubit>().init();
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
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            context.pushNamed(
                              GuaranteeEditScreen.routeName,
                              arguments: eS_WarrantyDetail.WarrantyNo,
                            ).then((value) {
                              if (value != null && value == true) {
                                context.read<GuaranteeManageCubit>().init();
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
                            IDialog.showConfirmDeleteDialog(
                              context,
                              AppStrings.confirmDeleteTitle,
                            ).then((value) {
                              if(value != null && value == true) {
                                context.read<GuaranteeManageCubit>().delete(
                                  ES_WarrantyDeleteModel(
                                    WarrantyNo: eS_WarrantyDetail.WarrantyNo,
                                    OrgID: eS_WarrantyDetail.OrgID,
                                  ),
                                ).then((value) {
                                  context.read<GuaranteeManageCubit>().init();
                                });
                              }
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: const BoxDecoration(
                              color: AppColors.textRedColor,
                              borderRadius: BorderRadius.all(Radius.circular(5),
                              ),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.trashCan,
                              size: 16,
                              color: AppColors.textWhiteColor,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      eS_WarrantyDetail.SerialNo,
                      style: AppTextStyles.textStyleInterW600S16Primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        eS_WarrantyDetail.WarrantyDTimeUTC,
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${eS_WarrantyDetail.ProductName} (${eS_WarrantyDetail.ProductCodeUser})',
                  style: AppTextStyles.textStyleInterW400S14Grey,
                ),
                Text(
                  'KH: ${eS_WarrantyDetail.CustomerName} (${eS_WarrantyDetail.CustomerPhoneNo})',
                  style: AppTextStyles.textStyleInterW400S14Grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonAdd() {
    return Row(
      children: [
        Expanded(child: Container()),
        InkWell(
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          onTap: () {
            context.pushNamed(
              GuaranteeActivateScreen.routeName,
            ).then((value) {
              if (value != null && value == true) {
                context.read<GuaranteeManageCubit>().init();
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: const Icon(
              FontAwesomeIcons.plus,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
