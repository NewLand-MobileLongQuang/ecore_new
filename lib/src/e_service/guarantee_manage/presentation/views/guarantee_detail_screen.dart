import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_expansion_tile.dart';
import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_detail_cubit/guarantee_detail_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../common/widgets/i_scroll_image.dart';


class GuaranteeDetailScreen extends StatefulWidget {
  const GuaranteeDetailScreen({required this.id, super.key});

  static const routeName = 'guarantee-detail';
  final String id;

  @override
  State<GuaranteeDetailScreen> createState() => _GuaranteeDetailScreenState();
}

class _GuaranteeDetailScreenState extends State<GuaranteeDetailScreen> {
  late List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile;
  late ES_WarrantyDetail eS_WarrantyDetail;

  @override
  void initState() {
    context.read<GuaranteeDetailCubit>().init(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(GuaranteeDetailScreen.routeName);

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
          InkWell(
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
            onTap: () {
              context.pushNamed(
                GuaranteeEditScreen.routeName,
                arguments: eS_WarrantyDetail.WarrantyNo,
              ).then((value) {
                if (value != null && value == true) {
                  context.read<GuaranteeDetailCubit>().init(widget.id);
                }
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
          InkWell(
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
            onTap: () {
              IDialog.showConfirmDeleteDialog(
                context,
                AppStrings.confirmDeleteTitle,
              ).then((value) {
                if(value != null && value == true) {
                  context.read<GuaranteeDetailCubit>().delete(
                    ES_WarrantyDeleteModel(
                      WarrantyNo: eS_WarrantyDetail.WarrantyNo,
                      OrgID: eS_WarrantyDetail.OrgID ?? '',
                    ),
                  ).then((value) {
                    Navigator.of(context).pop(true);
                  });
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<GuaranteeDetailCubit, GuaranteeDetailState>(
            listener: (context, state) {
              if(state is GuaranteeDetailLoaded){
                Lst_ES_WarrantyAttachFile = state.Lst_ES_WarrantyAttachFile;
                eS_WarrantyDetail = state.eS_WarrantyDetail;
              }
            },
            builder: (context, state) {
              if(state is GuaranteeDetailLoading){
                return const LoadingView();
              }
              if(state is GuaranteeDetailError){
                return Center(child: Text(state.message));
              }
              if(state is GuaranteeDetailLoaded){
                return ListView(
                  children: [
                    _titleProductInformation(l),
                    const SizedBox(height: 16),
                    _titleCustomerInformation(l),
                    const SizedBox(height: 16),
                    _titleInstallInformation(l),
                    const SizedBox(height: 16),
                    _imageArea(l),
                  ],
                );
              }
              return Container();
              }
            ),
        ),
      ),
    );
  }

  Widget _textTitle(LocalizationHelper l) {
    return Text(
      l(AppStrings.guaranteeDetailTitle),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _titleProductInformation(LocalizationHelper l) {
    return IExpansionTile(
      title: l(AppStrings.productInformation),
      trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
      trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _item(title: l(AppStrings.serialTitle), value: eS_WarrantyDetail.SerialNo),
        _item(title: l(AppStrings.typeProductTitle), value: eS_WarrantyDetail.ProductCodeUser),
        _item(title: l(AppStrings.manufactureDateTitle), value: eS_WarrantyDetail.ProductionDTimeUTC),
        _item(title: l(AppStrings.workshopTitle), value: eS_WarrantyDetail.FactoryCode),
        _item(title: l(AppStrings.kcsTitle), value: eS_WarrantyDetail.KCS),
      ]
    );
  }

  Widget _titleCustomerInformation(LocalizationHelper l) {
    return IExpansionTile(
      title: l(AppStrings.customerInformation),
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _item(title: l(AppStrings.customerIdTitle), value: eS_WarrantyDetail.CustomerCode),
        _item(title: l(AppStrings.customerNameTitle), value: eS_WarrantyDetail.CustomerName),
        _item(title: l(AppStrings.customerPhoneTitle), value: eS_WarrantyDetail.CustomerPhoneNo),
        _item(title: l(AppStrings.customerAddressTitle), value: eS_WarrantyDetail.CustomerAddress),
        _item(title: l(AppStrings.customerEmailTitle), value: eS_WarrantyDetail.CustomerEmail),
      ]
    );
  }

  Widget _titleInstallInformation(LocalizationHelper l) {
    return IExpansionTile(
      title: l(AppStrings.installInformation),
      trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
      trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _item(title: l(AppStrings.installNameTitle), value: eS_WarrantyDetail.AgentName),
        _item(title: l(AppStrings.installDateTitle), value: StringGenerate.convertTimeUTC(eS_WarrantyDetail.InstallationDTimeUTC)),
        _item(title: l(AppStrings.installTimeTitle), value: eS_WarrantyDetail.WarrantyDTimeUTC),
        _item(title: l(AppStrings.expiredDateTitle), value: eS_WarrantyDetail.WarrantyExpDTimeUTC),
        _item(title: l(AppStrings.noteTitle), value: eS_WarrantyDetail.Remark, maxLine: 4),
      ],
    );
  }

  Widget _item({
    required String title,
    required String value,
    int? maxLine,
  }) {
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

  Widget _imageArea(LocalizationHelper l) {
    return IScrollImage(
      listWarrantyAttachFile: Lst_ES_WarrantyAttachFile,
      flagDelete: false,
      title: l(AppStrings.installImage),
    );
  }
}
