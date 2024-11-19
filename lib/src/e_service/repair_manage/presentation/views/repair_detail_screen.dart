import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_expansion_tile.dart';
import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/common/widgets/i_scroll_image.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_delete_model.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_attach_file.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_component.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_detail_cubit/repair_detail_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/views/repair_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepairDetailScreen extends StatefulWidget {
  const RepairDetailScreen({required this.id, super.key});

  static const routeName = 'repair-detail';
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
    final l = context.localizer(RepairDetailScreen.routeName);

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
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.textWhiteColor,
            child: const LoadingView(),
          );
        }
        if (state is RepairDetailLoaded){
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
              actions: [
                if(eS_RODetail.ROStatus != 'FINISH')...[
                  InkWell(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    onTap: () {
                      context.pushNamed(
                        EServiceUtils.getFullRouteName(RepairEditScreen.routeName),
                        arguments: eS_RODetail.RONo,
                      ).then((value){
                        if (value != null && value == true) {
                          context.read<RepairDetailCubit>().init(widget.id);
                        };
                      });
                    },
                    child: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        FontAwesomeIcons.pencil,
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
                    child: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        FontAwesomeIcons.trashCan,
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
                    _titleRequestInformation(l),
                    const SizedBox(height: 16),
                    _titleResponseInformation(l),
                    const SizedBox(height: 16),
                    _imageAreaBeforeInstall(l),
                    const SizedBox(height: 16),
                    _imageAreaAfterInstall(l),
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

  Widget _textTitle(LocalizationHelper l) {
    return Text(
      l(AppStrings.repairRequestDetailTitle),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _titleRequestInformation(LocalizationHelper l) {
    return IExpansionTile(
        title: l(AppStrings.requestInformation),
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
        initiallyExpanded: true,
        children: [
          _item(title: l(AppStrings.requestTimeTitle), value: eS_RODetail.ReceptionDTimeUTC),
          _item(title: l(AppStrings.customerNameTitle), value: eS_RODetail.CustomerNameReal),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _item(title: l(AppStrings.customerPhoneTitle), value: eS_RODetail.CustomerPhoneNo)),
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
                    FontAwesomeIcons.phone,
                    size: 24,
                    color: AppColors.textWhiteColor,
                  ),
                ),
              ),
            ],
          ),
          _item(title: l(AppStrings.customerAddressTitle), value: eS_RODetail.CustomerAddress),
          _item(title: l(AppStrings.repairStaffName), value: eS_RODetail.AgentName),
          _item(title: l(AppStrings.requestDescription), value: eS_RODetail.RODesc, maxLine: 4),
          _item(title: l(AppStrings.requestDeadlineTitle), value: eS_RODetail.Deadline),
        ]
    );
  }

  Widget _titleResponseInformation(LocalizationHelper l) {
    final listComponent = Lst_ES_ROComponent.map((e) => '${e.ComponentName} - ${e.ComponentCode}').join('\n');
    return IExpansionTile(
        title: l(AppStrings.requestActivityInformation),
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
        children: [
          _item(title: l(AppStrings.requestStatus), value: eS_RODetail.ROStatus),
          _item(title: l(AppStrings.requestExpiredDateTitle), value: eS_RODetail.FinishDTimeUser),
          _item(title: l(AppStrings.serialTitle), value: eS_RODetail.SerialNo),
          _item(title: l(AppStrings.productName), value: '${eS_RODetail.ProductName} - ${eS_RODetail.ProductCodeUser}'),
          _item(title: l(AppStrings.errorType), value: '${eS_RODetail.ErrorTypeName} - ${eS_RODetail.ErrorTypeCode}'),
          _item(title: l(AppStrings.listComponents), value: listComponent, maxLine: null),
          _item(title: l(AppStrings.noteTitle), value: eS_RODetail.Remark, maxLine: null),
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

  Widget _imageAreaBeforeInstall(LocalizationHelper l) {
    return IScrollImage(
      listROAttachFile: Lst_ES_ROAttachFileBefore,
      flagDelete: false,
      title: l(AppStrings.requestImageBefore),
    );
  }

  Widget _imageAreaAfterInstall(LocalizationHelper l) {
    return IScrollImage(
      listROAttachFile: Lst_ES_ROAttachFileAfter,
      flagDelete: false,
      title: l(AppStrings.requestImageAfter),
    );
  }
}
