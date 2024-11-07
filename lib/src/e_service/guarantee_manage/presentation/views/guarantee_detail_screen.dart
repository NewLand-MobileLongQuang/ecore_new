import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_expansion_tile.dart';

import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';

import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/guarantee_manage/data/models/es_warranty_delete_model.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_detail_cubit/guarantee_detail_cubit.dart';

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../common/widgets/i_scroll_image.dart';


class GuaranteeDetailScreen extends StatefulWidget {
  const GuaranteeDetailScreen({required this.id, super.key});

  static const routeName = '/guarantee-detail';
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
          InkWell(
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
            onTap: () async {
              await Navigator.of(context)
                  .pushNamed('/guarantee-edit', arguments: eS_WarrantyDetail.WarrantyNo)
                  .then((value) {
                if (value != null && value == true) {
                  context.read<GuaranteeDetailCubit>().init(widget.id);
                }
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
                    _titleProductInformation(),
                    const SizedBox(height: 16),
                    _titleCustomerInformation(),
                    const SizedBox(height: 16),
                    _titleInstallInformation(),
                    const SizedBox(height: 16),
                    _imageArea(),
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

  Widget _textTitle() {
    return Text(
      AppStrings.guaranteeDetailTitle,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _titleProductInformation() {
    return IExpansionTile(
      title: AppStrings.productInformation,
      trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
      trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _item(title: AppStrings.serialTitle, value: eS_WarrantyDetail.SerialNo),
        _item(title: AppStrings.typeProductTitle, value: eS_WarrantyDetail.ProductCodeUser),
        _item(title: AppStrings.manufactureDateTitle, value: eS_WarrantyDetail.ProductionDTimeUTC),
        _item(title: AppStrings.workshopTitle, value: eS_WarrantyDetail.FactoryCode),
        _item(title: AppStrings.kcsTitle, value: eS_WarrantyDetail.KCS),
      ]
    );
  }

  Widget _titleCustomerInformation() {
    return IExpansionTile(
      title: AppStrings.customerInformation,
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _item(title: AppStrings.customerIdTitle, value: eS_WarrantyDetail.CustomerCodeSys),
        _item(title: AppStrings.customerNameTitle, value: eS_WarrantyDetail.CustomerName),
        _item(title: AppStrings.customerPhoneTitle, value: eS_WarrantyDetail.CustomerPhoneNo),
        _item(title: AppStrings.customerAddressTitle, value: eS_WarrantyDetail.CustomerAddress),
        _item(title: AppStrings.customerEmailTitle, value: eS_WarrantyDetail.CustomerEmail),
      ]
    );
  }

  Widget _titleInstallInformation() {
    return IExpansionTile(
      title: AppStrings.installInformation,
      trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
      trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _item(title: AppStrings.installNameTitle, value: eS_WarrantyDetail.AgentCode),
        _item(title: AppStrings.installDateTitle, value: eS_WarrantyDetail.InstallationDTimeUTC),
        _item(title: AppStrings.installTimeTitle, value: eS_WarrantyDetail.WarrantyDTimeUTC),
        _item(title: AppStrings.expiredDateTitle, value: eS_WarrantyDetail.WarrantyExpDTimeUTC),
        _item(title: AppStrings.noteTitle, value: eS_WarrantyDetail.Remark, maxLine: 4),
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

  Widget _imageArea() {
    return IScrollImage(
      listWarrantyAttachFile: Lst_ES_WarrantyAttachFile,
      flagDelete: false,
      title: AppStrings.installImage,
    );
  }
}
