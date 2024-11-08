import 'dart:io';

import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecore/core/common/widgets/inputs/i_expansion_tile.dart';
import 'package:ecore/core/common/widgets/inputs/i_select_time.dart';
import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_edit.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_edit_cubit/guarantee_edit_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../common/widgets/i_scroll_image.dart';

class GuaranteeEditScreen extends StatefulWidget {
  const GuaranteeEditScreen({required this.id, super.key});

  static const routeName = 'guarantee-edit';
  final String id;

  @override
  State<GuaranteeEditScreen> createState() => _GuaranteeEditScreenState();
}

class _GuaranteeEditScreenState extends State<GuaranteeEditScreen> {
  final TextEditingController _installTimeController = TextEditingController();
  final TextEditingController _expiredDateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  late List<File?> listFile;
  late List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile;
  late ES_WarrantyDetail eS_WarrantyDetail;

  DateTime? selectedDate;

  void saveLocalInformation() {
    eS_WarrantyDetail
      ..WarrantyDTimeUTC = _installTimeController.text
      ..WarrantyExpDTimeUTC = _expiredDateController.text
      ..Remark = _noteController.text;
  }

  @override
  void initState() {
    context.read<GuaranteeEditCubit>().init(widget.id);
    listFile = [];
    Lst_ES_WarrantyAttachFile = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(GuaranteeEditScreen.routeName);

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
              context.read<GuaranteeEditCubit>().update(
                ES_WarrantyEdit(
                  WarrantyNo: eS_WarrantyDetail.WarrantyNo,
                  OrgID: eS_WarrantyDetail.OrgID,
                  SerialNo: eS_WarrantyDetail.SerialNo,
                  ProductCode: eS_WarrantyDetail.ProductCode,
                  ProductionDTimeUTC: eS_WarrantyDetail.ProductionDTimeUTC,
                  FactoryCode: eS_WarrantyDetail.FactoryCode,
                  KCS: eS_WarrantyDetail.KCS,
                  CustomerCodeSys: eS_WarrantyDetail.CustomerCodeSys,
                  CustomerName: eS_WarrantyDetail.CustomerName,
                  CustomerPhoneNo: eS_WarrantyDetail.CustomerPhoneNo,
                  CustomerAddress: eS_WarrantyDetail.CustomerAddress,
                  CustomerEmail: eS_WarrantyDetail.CustomerEmail,
                  AgentCode: eS_WarrantyDetail.AgentCode,
                  InstallationDTimeUTC: eS_WarrantyDetail.InstallationDTimeUTC,
                  WarrantyDTimeUTC: _installTimeController.text,
                  WarrantyExpDTimeUTC: _expiredDateController.text,
                  WarrantyStatus: eS_WarrantyDetail.WarrantyStatus,
                  Remark: _noteController.text,
                ),
                Lst_ES_WarrantyAttachFile,
                listFile,
              );
            },
            child: const SizedBox(
              height: 36,
              width: 36,
              child: Icon(
                FontAwesomeIcons.floppyDisk,
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
          child: BlocConsumer<GuaranteeEditCubit, GuaranteeEditState>(
            listener: (context, state) {
              if (state is GuaranteeEditLoaded) {
                _installTimeController.text = state.eS_WarrantyDetail.WarrantyDTimeUTC;
                _expiredDateController.text = state.eS_WarrantyDetail.WarrantyExpDTimeUTC;
                _noteController.text = state.eS_WarrantyDetail.Remark;

                Lst_ES_WarrantyAttachFile = state.Lst_ES_WarrantyAttachFile;
                eS_WarrantyDetail = state.eS_WarrantyDetail;
              }
              if (state is GuaranteeEditSuccess) {
                Navigator.of(context).maybePop(true);
              }
            },
            builder: (context, state) {
              if (state is GuaranteeEditLoading) {
                return const LoadingView();
              }
              if (state is GuaranteeEditError) {
                return Center(child: Text(state.message));
              }
              if (state is GuaranteeEditLoaded) {
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
            },
          ),
        ),
      ),
    );
  }

  Widget _textTitle(LocalizationHelper l) {
    return Text(
      l(AppStrings.guaranteeEditTitle),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _titleProductInformation(LocalizationHelper l) {
    return IExpansionTile(
      title: AppStrings.productInformation,
      trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
      trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _itemText(title: l(AppStrings.serialTitle), value: eS_WarrantyDetail.SerialNo),
        _itemText(title: l(AppStrings.typeProductTitle), value: eS_WarrantyDetail.ProductCodeUser),
        _itemText(title: l(AppStrings.manufactureDateTitle), value: eS_WarrantyDetail.ProductionDTimeUTC),
        _itemText(title: l(AppStrings.workshopTitle), value: eS_WarrantyDetail.FactoryCode),
        _itemText(title: l(AppStrings.kcsTitle), value: eS_WarrantyDetail.KCS),
      ],
    );
  }

  Widget _titleCustomerInformation(LocalizationHelper l) {
    return IExpansionTile(
      title: AppStrings.customerInformation,
      trailingExpansionTrue: _buttonCustomer(true),
      trailingExpansionFalse: _buttonCustomer(false),
      children: [
        _itemText(title: l(AppStrings.customerIdTitle), value: eS_WarrantyDetail.CustomerCodeSys),
        _itemText(title: l(AppStrings.customerNameTitle), value: eS_WarrantyDetail.CustomerName),
        _itemText(title: l(AppStrings.customerPhoneTitle), value: eS_WarrantyDetail.CustomerPhoneNo),
        _itemText(title: l(AppStrings.customerAddressTitle), value: eS_WarrantyDetail.CustomerAddress),
        _itemText(title: l(AppStrings.customerEmailTitle), value: eS_WarrantyDetail.CustomerEmail),
      ]
    );
  }

  Widget _titleInstallInformation(LocalizationHelper l) {
    return IExpansionTile(
      title: AppStrings.productInformation,
      trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
      trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _itemText(title: l(AppStrings.installNameTitle), value: eS_WarrantyDetail.AgentCode),
        _itemText(title: l(AppStrings.installDateTitle), value: eS_WarrantyDetail.InstallationDTimeUTC),
        _itemTime(controller: _installTimeController, title: l(AppStrings.installTimeTitle)),
        _itemTime(controller: _expiredDateController, title: l(AppStrings.expiredDateTitle)),
        _itemTextField(controller: _noteController, title: l(AppStrings.noteTitle)),
      ],
    );
  }

  Widget _itemText({
    required String title,
    required String value,
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
          ),
        )
      ],
    );
  }

  Widget _itemTime({
    required TextEditingController controller,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        DateTimePickerField(
          controller: controller,
          label: title,
        )
      ],
    );
  }

  Widget _itemTextField({
    required TextEditingController controller,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ITextField(
          controller: controller,
          label: title,
        ),
      ],
    );
  }

  Widget _imageArea(LocalizationHelper l) {
    return IScrollImage(
      listFile: listFile,
      listWarrantyAttachFile: Lst_ES_WarrantyAttachFile,
      flagGallery: true,
      flagCamera: true,
      flagDelete: true,
      title: l(AppStrings.installImage),
    );
  }

  Widget _buttonCustomer(bool check) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            saveLocalInformation();
            Navigator.pushNamed(context, '/customer-manage').then((value) {
              if (value != null) {
                value as ES_Customer;
                context.read<GuaranteeEditCubit>().fillCustomer(
                  eS_WarrantyDetail,
                  Lst_ES_WarrantyAttachFile,
                  value,
                );
              }
            });
          },
          child: Container(
            height: 24,
            width: 36,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Icon(
              Icons.list,
              size: 20,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/customer-create').then((value) {
              if (value != null) {
                value as ES_Customer;
                context.read<GuaranteeEditCubit>().fillCustomer(
                  eS_WarrantyDetail,
                  Lst_ES_WarrantyAttachFile,
                  value,
                );
              }
            });
          },
          child: Container(
            height: 24,
            width: 36,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Icon(
              Icons.add,
              size: 20,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        if(check == true)...[
          SvgPicture.asset(AppMediaRes.iconExpandUp),
        ],
        if(check == false)...[
          SvgPicture.asset(AppMediaRes.iconExpandDown),
        ],
      ],
    );
  }
}
