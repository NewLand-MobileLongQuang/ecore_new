import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_expansion_tile.dart';

import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';

import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_delete_model.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_attach_file.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_component.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_detail_cubit/repair_detail_cubit.dart';

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../common/widgets/i_scroll_image.dart';

class RepairDetailScreen extends StatefulWidget {
  const RepairDetailScreen({required this.id, super.key});

  static const routeName = '/repair-detail';
  final String id;

  @override
  State<RepairDetailScreen> createState() => _RepairDetailScreenState();
}

class _RepairDetailScreenState extends State<RepairDetailScreen> {
  late ES_RODetail eS_RODetail;
  late List<ES_ROComponent> Lst_ES_ROComponent;
  late List<ES_ROAttachFile> Lst_ES_ROAttachFileBefore;
  late List<ES_ROAttachFile> Lst_ES_ROAttachFileAfter;

  @override
  void initState() {
    context.read<RepairDetailCubit>().init(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepairDetailCubit, RepairDetailState>(
      listener: (context, state) {
        if (state is RepairDetailLoaded) {
          eS_RODetail = state.eS_RODetail;
          Lst_ES_ROComponent = state.Lst_ES_ROComponent;
          Lst_ES_ROAttachFileBefore = state.Lst_ES_ROAttachFile.where((element) => element.ROAttachFileType == '0').toList();
          Lst_ES_ROAttachFileAfter = state.Lst_ES_ROAttachFile.where((element) => element.ROAttachFileType == '1').toList();
        }
        if (state is RepairDetailDeleteSuccess) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Xóa thành công!'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RepairDetailLoading) {
          return const LoadingView();
        }
        if (state is RepairDetailLoaded){
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
                if(eS_RODetail.ROStatus != 'FINISH')...[
                  InkWell(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/repair-edit', arguments: eS_RODetail.RONo)
                          .then((value){
                        if (value != null && value == true) {
                          context.read<RepairDetailCubit>().init(widget.id);
                        };
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 48,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                        color: AppColors.textWhiteColor,
                      ),
                    ),
                  ),
                ],
                if(eS_RODetail.ROStatus != 'FINISH')...[
                  InkWell(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    onTap: () {
                      IDialog.showConfirmDeleteDialog(
                        context,
                        AppStrings.confirmDeleteTitle,
                      ).then((value) {
                        if (value != null && value == true) {
                          context.read<RepairDetailCubit>().delete(
                            ES_RODeleteModel(
                              RONO: eS_RODetail.RONo ?? '',
                              OrgID: eS_RODetail.OrgID ?? '',
                            ),
                          );
                        }
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 48,
                      decoration: const BoxDecoration(
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
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    _item(title: AppStrings.requestTitle, value: state.eS_RODetail.RONo),
                    const SizedBox(height: 16),
                    _titleRequestInformation(),
                    const SizedBox(height: 16),
                    _titleResponseInformation(),
                    const SizedBox(height: 16),
                    _imageAreaBeforeInstall(),
                    const SizedBox(height: 16),
                    _imageAreaAfterInstall(),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.repairRequestDetailTitle,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _titleRequestInformation() {
    return IExpansionTile(
        title: AppStrings.requestInformation,
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
        children: [
          _item(title: AppStrings.requestTimeTitle, value: eS_RODetail.ReceptionDTimeUTC),
          _item(title: AppStrings.customerNameTitle, value: eS_RODetail.CustomerName),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _item(title: AppStrings.customerPhoneTitle, value: eS_RODetail.CustomerPhoneNo)),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {

                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Icon(
                    Icons.call,
                    size: 28,
                    color: AppColors.textWhiteColor,
                  ),
                ),
              ),
            ],
          ),
          _item(title: AppStrings.customerAddressTitle, value: eS_RODetail.CustomerAddress),
          _item(title: AppStrings.repairStaffName, value: eS_RODetail.AgentName),
          _item(title: AppStrings.requestDescription, value: eS_RODetail.RODesc, maxLine: 4),
          _item(title: AppStrings.requestDeadlineTitle, value: eS_RODetail.Deadline),
        ]
    );
  }

  Widget _titleResponseInformation() {
    final listComponent = eS_RODetail.ListComponentCode?.split(' ') ?? [];
    return IExpansionTile(
        title: AppStrings.requestActivityInformation,
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
        children: [
          _item(title: AppStrings.requestStatus, value: eS_RODetail.ROStatus),
          _item(title: AppStrings.requestExpiredDateTitle, value: eS_RODetail.FinishDTimeUser),
          _item(title: AppStrings.serialTitle, value: eS_RODetail.SerialNo),
          _item(title: AppStrings.productName, value: eS_RODetail.ProductCode),
          _item(title: AppStrings.errorType, value: eS_RODetail.ErrorTypeCode),
          _item(title: AppStrings.listComponents, value: listComponent.join('\n') ?? '', maxLine: listComponent.isEmpty ? 1 : eS_RODetail.ListComponentCode
              ?.split(' ')
              .length),
          _item(title: AppStrings.noteTitle, value: eS_RODetail.Remark, maxLine: 4),
        ]
    );
  }

  Widget _item({required String title, required String value, int? maxLine}) {
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
            readOnly: true,
            hintText: value,
            hintStyle: AppTextStyles.textStyleInterW400S14Black,
            label: title,
            maxLines: maxLine,
          ),
        ),
      ],
    );
  }

  Widget _imageAreaBeforeInstall() {
    return IScrollImage(
      listROAttachFile: Lst_ES_ROAttachFileBefore,
      flagDelete: false,
      title: AppStrings.requestImageBefore,
    );
  }

  Widget _imageAreaAfterInstall() {
    return IScrollImage(
      listROAttachFile: Lst_ES_ROAttachFileAfter,
      flagDelete: false,
      title: AppStrings.requestImageAfter,
    );
  }
}
