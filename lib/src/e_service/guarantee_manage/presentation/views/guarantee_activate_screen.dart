import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_expansion_tile.dart';

import 'package:ecore/core/common/widgets/inputs/i_select_time.dart';
import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';

import 'package:ecore/core/utils/string_generate.dart';

import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_create.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_install.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/cubit/guarantee_activate_cubit/guarantee_activate_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/modules/auth/domain/entities/session_info.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../../../common/widgets/i_scroll_image.dart';

class GuaranteeActivateScreen extends StatefulWidget {
  const GuaranteeActivateScreen({super.key});

  static const routeName = '/guarantee-activate';

  @override
  State<GuaranteeActivateScreen> createState() => _GuaranteeActivateScreenState();
}

class _GuaranteeActivateScreenState extends State<GuaranteeActivateScreen> {
  final TextEditingController _installTimeController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();

  late RT_ES_WarrrantyActivateByQR rT_ES_WarrrantyActivateByQR;
  late ES_Customer eS_Customer;
  late ES_WarrantyInstall eS_WarrantyInstall;

  late List<File?> listFile;

  void saveLocalInformation() {
    eS_WarrantyInstall
      ..installTime = _installTimeController.text
      ..note = _noteController.text;
    // rT_ES_WarrrantyActivateByQR.ProductCode = _serialNoController.text;
  }

  final ss = SessionInfo.current();

  @override
  void initState() {
    context.read<GuaranteeActivateCubit>().init();
    listFile = [];
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
              final prefs = await SharedPreferences.getInstance();
              final email = prefs.getString('cached_email') ?? '';
              await context.read<GuaranteeActivateCubit>().create(
                  ES_WarrantyCreate(
                    OrgID: ss.org?.Id.toString() ?? '',
                    SerialNo: _serialNoController.text,
                    ProductCode: rT_ES_WarrrantyActivateByQR.ProductCode,
                    ProductionDTimeUTC: rT_ES_WarrrantyActivateByQR.ProductionDTimeUTC,
                    FactoryCode: rT_ES_WarrrantyActivateByQR.FactoryCode,
                    KCS: rT_ES_WarrrantyActivateByQR.KCS,
                    CustomerCodeSys: eS_Customer.CustomerCodeSys,
                    CustomerName: eS_Customer.CustomerName,
                    CustomerPhoneNo: eS_Customer.CustomerPhoneNo,
                    CustomerAddress: eS_Customer.CustomerAddress,
                    CustomerEmail: eS_Customer.CustomerEmail,
                    AgentCode: email,
                    InstallationDTimeUTC: Utils().strDateTime(eS_WarrantyInstall.installDate),
                    WarrantyDTimeUTC: eS_WarrantyInstall.installTime,
                    WarrantyExpDTimeUTC: eS_WarrantyInstall.expiredDate,
                    Remark: _noteController.text,
                  ),
                  listFile
              );
            },
            child: Container(
              height: 36,
              width: 48,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: const Icon(
                Icons.save,
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
          child: BlocConsumer<GuaranteeActivateCubit, GuaranteeActivateState>(
            listener: (context, state) {
              if (state is GuaranteeActivateError) {
                IDialog.showNotificationDialog(context, state.message);
              }
              if(state is GuaranteeActivateLoaded) {
                if(state.rT_ES_WarrrantyActivateByQR.SerialNo.isEmpty) {
                  _serialNoController.text = state.rT_ES_WarrrantyActivateByQR.SerialNo;
                }
                else {
                  _serialNoController.text = StringGenerate.extractQRCode(state.rT_ES_WarrrantyActivateByQR.SerialNo);
                }
                _installTimeController.text = state.eS_WarrantyInstall.installTime;
                _noteController.text = state.eS_WarrantyInstall.note;

                rT_ES_WarrrantyActivateByQR = state.rT_ES_WarrrantyActivateByQR;
                eS_Customer = state.eS_Customer;
                eS_WarrantyInstall = state.eS_WarrantyInstall;
              }
              if(state is GuaranteeActivateSuccess) {
                Navigator.of(context).maybePop(true);
              }
            },
            builder: (context, state) {
              if (state is GuaranteeActivateLoading) {
                return const LoadingView();
              }
              if (state is GuaranteeActivateLoaded) {
                return ListView(
                  children: [
                    _scanner(),
                    const SizedBox(height: 16),
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
            },
          ),
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.guaranteeActivateTitle,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _scanner() {
    return Row(
      children: [
        Expanded(
          child: ITextField(
            controller: _serialNoController,
            hintText: AppStrings.scanProductCode,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              value = _serialNoController.text;
              context.read<GuaranteeActivateCubit>().scanQrCode(
                value,
                eS_Customer,
                eS_WarrantyInstall,
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: (){
            saveLocalInformation();
            Navigator.pushNamed(
              context,
              'QrCodeView.routeName',
            ).then((value) {
              if (value != null) {
                context.read<GuaranteeActivateCubit>().scanQrCode(
                  value.toString(),
                  eS_Customer,
                  eS_WarrantyInstall,
                );
              }
            });
          },
          child: Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Icon(
              Icons.qr_code,
              size: 28,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _titleProductInformation() {
    return IExpansionTile(
      title: AppStrings.productInformation,
      trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
      trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
      children: [
        _itemText(title: AppStrings.serialTitle, value: _serialNoController.text),
        _itemText(title: AppStrings.typeProductTitle, value: rT_ES_WarrrantyActivateByQR.ProductCodeUser),
        _itemText(title: AppStrings.manufactureDateTitle, value: rT_ES_WarrrantyActivateByQR.ProductionDTimeUTC),
        _itemText(title: AppStrings.workshopTitle, value: rT_ES_WarrrantyActivateByQR.FactoryCode),
        _itemText(title: AppStrings.kcsTitle, value: rT_ES_WarrrantyActivateByQR.KCS),
      ],
    );
  }

  Widget _titleCustomerInformation() {
    return IExpansionTile(
        title: AppStrings.customerInformation,
        trailingExpansionTrue: _buttonCustomer(true),
        trailingExpansionFalse: _buttonCustomer(false),
        children: [
          _itemText(title: AppStrings.customerIdTitle, value: eS_Customer.CustomerCode),
          _itemText(title: AppStrings.customerNameTitle, value: eS_Customer.CustomerName),
          _itemText(title: AppStrings.customerPhoneTitle, value: eS_Customer.CustomerPhoneNo),
          _itemText(title: AppStrings.customerAddressTitle, value: eS_Customer.CustomerAddress),
          _itemText(title: AppStrings.customerEmailTitle, value: eS_Customer.CustomerEmail),
        ]
    );
  }

  Widget _titleInstallInformation() {
    return IExpansionTile(
        title: AppStrings.installInformation,
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
        children: [
          _itemText(title: AppStrings.installNameTitle, value: eS_WarrantyInstall.name),
          _itemText(title: AppStrings.installDateTitle, value: Utils().strDateTime(eS_WarrantyInstall.installDate)),
          _itemTime(
              controller: _installTimeController,
              title: AppStrings.installTimeTitle,
              onTap: () {
                context.read<GuaranteeActivateCubit>().chooseDateAndTime(
                  rT_ES_WarrrantyActivateByQR,
                  eS_Customer,
                  eS_WarrantyInstall,
                  _installTimeController.text,
                );
              }
          ),
          _itemText(title: AppStrings.expiredDateTitle, value: eS_WarrantyInstall.expiredDate),
          _itemTextField(controller: _noteController, title: AppStrings.noteTitle),
        ]
    );
  }

  Widget _itemText({required String title, required String value, int? maxLine}) {
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
        )
      ],
    );
  }

  Widget _itemTime({
    required TextEditingController controller,
    required String title,
    Function? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        DateTimePickerField(
          controller: controller,
          label: title,
          onTap: onTap,
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

  Widget _imageArea() {
    return IScrollImage(
      listFile: listFile,
      listWarrantyAttachFile: const [],
      flagGallery: true,
      flagCamera: true,
      flagDelete: true,
      title: AppStrings.installImage,
    );
  }

  Widget _buttonCustomer(bool check) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/customer-manage').then((value) => {
              if(value != null) {
                value as ES_Customer,
                context.read<GuaranteeActivateCubit>().fillCustomer(
                  rT_ES_WarrrantyActivateByQR,
                  value,
                  eS_WarrantyInstall,
                ),
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
            Navigator.pushNamed(context, '/customer-create').then((value) => {
              if(value != null) {
                value as ES_Customer,
                context.read<GuaranteeActivateCubit>().fillCustomer(
                  rT_ES_WarrrantyActivateByQR,
                  value,
                  eS_WarrantyInstall,
                ),
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
