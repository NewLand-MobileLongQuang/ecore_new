import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_search.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';

import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_manage_cubit/guarantee_manage_cubit.dart';

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';

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
          await context.read<GuaranteeManageCubit>().init();
        },
        displacement: 15,
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocConsumer<GuaranteeManageCubit, GuaranteeManageState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                if (state is GuaranteeManageLoading) {
                  return const LoadingView();
                }
                if (state is GuaranteeManageError) {
                  return Center(
                    child: Text(state.message),
                  );
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
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.guaranteeManageTitle,
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
        separatorBuilder: (context, index) => Container(height: 1, color: AppColors.divideColor,),
        itemBuilder: (context, index) {
          return _itemGuarantee(context, listGuarantee[index]);
        },
      ),
    );
  }

  Widget _itemGuarantee(BuildContext context, ES_WarrantyDetail eS_WarrantyDetail) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/guarantee-detail', arguments: eS_WarrantyDetail.WarrantyNo)
            .then((value) {
          if (value != null && value == true) {
            context.read<GuaranteeManageCubit>().init();
          }
        });
      },
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.6,
          children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, '/guarantee-detail', arguments: eS_WarrantyDetail.WarrantyNo)
                    .then((value) {
                  if (value != null && value == true) {
                    context.read<GuaranteeManageCubit>().init();
                  }
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
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/guarantee-detail', arguments: eS_WarrantyDetail.WarrantyNo)
                                .then((value) {
                              if (value != null && value == true) {
                                context.read<GuaranteeManageCubit>().init();
                              }
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
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/guarantee-edit', arguments: eS_WarrantyDetail.WarrantyNo)
                                .then((value) {
                              if (value != null && value == true) {
                                context.read<GuaranteeManageCubit>().init();
                              }
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
                            width: 48,
                            decoration: const BoxDecoration(
                              color: AppColors.buttonRedColor,
                              borderRadius: BorderRadius.all(Radius.circular(5),
                              ),
                            ),
                            child: const Icon(
                              Icons.delete,
                              size: 20,
                              color: AppColors.textWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
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
            //borderRadius: BorderRadius.circular(8),
            color: AppColors.textWhiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    eS_WarrantyDetail.SerialNo,
                    style: AppTextStyles.textStyleInterW400S16Black,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    eS_WarrantyDetail.InstallationDTimeUTC,
                    style: AppTextStyles.textStyleInterW400S14Grey,
                  ),
                ],
              ),
              Text(
                eS_WarrantyDetail.ProductCodeUser,
                style: AppTextStyles.textStyleInterW400S14Grey,
              ),
              Text(
                'KH: ${eS_WarrantyDetail.CustomerName}',
                style: AppTextStyles.textStyleInterW400S14Grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonAdd() {
    return Row(
      children: [
        Expanded(child: Container()),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/guarantee-activate')
                .then((value) {
              if (value != null && value == true) {
                context.read<GuaranteeManageCubit>().init();
              }
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size(64, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.textWhiteColor,
          ),
        ),
      ],
    );
  }
}
