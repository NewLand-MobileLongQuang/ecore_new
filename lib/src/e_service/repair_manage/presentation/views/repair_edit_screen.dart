import 'dart:io';

import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_expansion_tile.dart';
import 'package:ecore/core/common/widgets/inputs/i_multiselect_field.dart';
import 'package:ecore/core/common/widgets/inputs/i_select_field.dart';
import 'package:ecore/core/common/widgets/inputs/i_select_time.dart';
import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/common/widgets/qr_code_view.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:ecore/src/e_service/common/widgets/i_scroll_image.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/views/customer_detail_screen.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_component_model.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_edit_model.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_attach_file.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_edit_cubit/repair_edit_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/views/repair_manage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class RepairEditScreen extends StatefulWidget {
  const RepairEditScreen({required this.id, super.key});

  static const routeName = 'repair-edit';
  final String id;

  @override
  State<RepairEditScreen> createState() => _RepairEditScreenState();
}

class _RepairEditScreenState extends State<RepairEditScreen> {
  final TextEditingController _meetTimeController = TextEditingController();
  final TextEditingController _finishTimeController = TextEditingController();
  final TextEditingController _serialController = TextEditingController();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _errorTypeController = TextEditingController();
  final TextEditingController _listSysController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  late List<File?> listFileBefore;
  late List<File?> listFileAfter;
  late List<File?> listFileAll;

  late List<ES_ROAttachFile> Lst_ES_ROAttachFileBefore;
  late List<ES_ROAttachFile> Lst_ES_ROAttachFileAfter;
  late List<String> listROAttachFileType;

  late ES_RODetail eS_RODetail;
  late List<ES_ROComponentModel> Lst_ES_ROComponent;
  late List<ES_ROAttachFile> Lst_ES_ROAttachFile;

  late List<String> listErrorType;
  late List<String> listProduct;
  late List<String> listProductFull;
  late List<String> listErrorComponent;
  late String ProductGrpCode;

  DateTime? selectedDate;

  void saveLocalInformation() {
    eS_RODetail
      ..AppointmentDTimeUTC = _meetTimeController.text
      ..FinishDTimeUser = _finishTimeController.text
      ..SerialNo = eS_RODetail.SerialNo
      ..ProductCode = _productController.text
      ..ErrorTypeCode = _errorTypeController.text
      ..Remark = _noteController.text;
  }

  @override
  void initState() {
    context.read<RepairEditCubit>().init(widget.id);
    listFileBefore = [];
    listFileAfter = [];
    listFileAll = [];
    listROAttachFileType = [];
    Lst_ES_ROAttachFileBefore = [];
    Lst_ES_ROAttachFileAfter = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(RepairEditScreen.routeName);

    return BlocConsumer<RepairEditCubit, RepairEditState>(
      listener: (context, state) {
        if (state is RepairEditLoaded) {
          eS_RODetail = state.eS_RODetail;
          Lst_ES_ROComponent = state.Lst_ES_ROComponent as List<ES_ROComponentModel>;
          Lst_ES_ROAttachFile = state.Lst_ES_ROAttachFile;
          listErrorType = state.listErrorType;
          listProduct = state.listProduct.map((e) => "${e.split(' - ')[0]} - ${e.split(' - ')[1]}").toList();
          listProductFull = state.listProduct;

          listErrorComponent = state.listErrorComponent;
          ProductGrpCode = state.ProductGrpCode;

          _serialController.text = eS_RODetail.SerialNo;

          for(var i = 0; i < listErrorType.length; i++) {
            if(listErrorType[i].contains(eS_RODetail.ErrorTypeCode) && eS_RODetail.ErrorTypeCode.isNotEmpty) {
              _errorTypeController.text = listErrorType[i];
              break;
            }
          }
          for(var i = 0; i < listProduct.length; i++) {
            if(listProductFull[i].contains(eS_RODetail.ProductCode)) {
              _productController.text = listProduct[i];
              break;
            }
          }

          _listSysController.text = state.Lst_ES_ROComponent.map((e) => '${e.ComponentName} - ${e.ComponentCode}').join('\n');

          _meetTimeController.text = state.eS_RODetail.AppointmentDTimeUTC;
          _finishTimeController.text = state.eS_RODetail.FinishDTimeUser;
          if(_finishTimeController.text == '') {
            _finishTimeController.text = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          }
          _noteController.text = state.eS_RODetail.Remark;

          Lst_ES_ROAttachFileBefore = state.Lst_ES_ROAttachFile.where((element) => element.ROAttachFileType == '0').toList();
          Lst_ES_ROAttachFileAfter = state.Lst_ES_ROAttachFile.where((element) => element.ROAttachFileType == '1').toList();
        }
        if (state is RepairEditSuccess) {
          Navigator.of(context).maybePop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sửa thành công!'),
            ),
          );
        }
        if (state is RepairFinishSuccess) {
          context.pushReplacementNamed(RepairManageScreen.routeName);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Kết thúc sửa chữa!'),
            ),
          );
        }
        if (state is RepairEditError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RepairEditLoading) {
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.textWhiteColor,
              child: const LoadingView()
          );
        }
        if (state is RepairEditLoaded) {
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
                if(eS_RODetail.ROStatus != 'FINISH')
                  InkWell(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    onTap: () {
                      final listErrorTypeCodeSplit = _errorTypeController.text.split(' - ');
                      final ErrorTypeCode = listErrorTypeCodeSplit[listErrorTypeCodeSplit.length - 1];

                      var ProductCode = '';
                      for(var i = 0; i < listProductFull.length; i++) {
                        if(listProductFull[i].contains(_productController.text)) {
                          final listProductCodeSplit = listProductFull[i].split(' - ');
                          ProductCode = listProductCodeSplit[listProductCodeSplit.length - 1];
                          break;
                        }
                      }
                      final es_ROEdit = ES_ROEditModel(
                        OrgID: eS_RODetail.OrgID ?? '',
                        RONo: eS_RODetail.RONo ?? '',
                        ReceptionDTimeUTC: eS_RODetail.ReceptionDTimeUTC.isNotEmpty ? eS_RODetail.ReceptionDTimeUTC : null,
                        CustomerCodeSys: eS_RODetail.CustomerCodeSys ?? '',
                        CustomerName: eS_RODetail.CustomerName ?? '',
                        CustomerPhoneNo: eS_RODetail.CustomerPhoneNo ?? '',
                        CustomerAddress: eS_RODetail.CustomerAddress ?? '',
                        AgentCode: eS_RODetail.AgentCode ?? '',
                        RODesc: eS_RODetail.RODesc ?? '',
                        Deadline: eS_RODetail.Deadline.isNotEmpty ? eS_RODetail.Deadline : null,
                        ProductCode: ProductCode,
                        SerialNo: eS_RODetail.SerialNo,
                        FactoryCode: eS_RODetail.FactoryCode ?? '',
                        ErrorTypeCode: ErrorTypeCode,
                        ROStatus: eS_RODetail.ROStatus ?? '',
                        AppointmentDTimeUTC: _meetTimeController.text != '' ? _meetTimeController.text : null,
                        Remark: _noteController.text,
                      );

                      Lst_ES_ROAttachFile
                        ..clear()
                        ..addAll(Lst_ES_ROAttachFileBefore)..addAll(Lst_ES_ROAttachFileAfter);
                      listFileAll
                        ..clear()
                        ..addAll(listFileBefore)..addAll(listFileAfter);
                      listROAttachFileType
                        ..clear()
                        ..addAll(List.filled(listFileBefore.length, '0'))..addAll(List.filled(listFileAfter.length, '1'));

                      context.read<RepairEditCubit>().update(
                        es_ROEdit,
                        Lst_ES_ROComponent,
                        Lst_ES_ROAttachFile,
                        listROAttachFileType,
                        listFileAll,
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
                if(eS_RODetail.ROStatus != 'FINISH')
                  InkWell(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    onTap: () {
                      var currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
                      if(_finishTimeController.text != '') {
                        currentTime = _finishTimeController.text;
                      }
                      IDialog.showConfirmFinishDialog(
                        context,
                        AppStrings.confirmFinishTitle,
                      ).then((value) {
                        if (value != null && value == true) {
                          context.read<RepairEditCubit>().finish(eS_RODetail.RONo, currentTime, eS_RODetail.AgentCode);
                        }
                      });
                    },
                    child: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        FontAwesomeIcons.checkDouble,
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
                child: ListView(
                  children: [
                    _item(title: '${AppStrings.requestTitle} (*)', value: eS_RODetail.RONo ?? ''),
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
      l(AppStrings.repairRequestEditTitle),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _titleRequestInformation(LocalizationHelper l) {
    return IExpansionTile(
        title: l(AppStrings.requestInformation),
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
        initiallyExpanded: false,
        children: [
          _item(title: '${l(AppStrings.requestTimeTitle)} (*)', value: eS_RODetail.ReceptionDTimeUTC),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _item(title: '${l(AppStrings.customerNameTitle)} (*)', value: eS_RODetail.CustomerNameReal)),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  context.pushNamed(
                    EServiceUtils.getFullRouteName(CustomerDetailScreen.routeName),
                    arguments: eS_RODetail.CustomerCodeSys,
                  );
                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.info,
                    size: 24,
                    color: AppColors.textWhiteColor,
                  ),
                ),
              ),
            ],
          ),
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
          _item(title: '${l(AppStrings.repairStaffName)} (*)', value: eS_RODetail.AgentName),
          _item(title: l(AppStrings.requestDescription), value: eS_RODetail.RODesc, maxLine: 4),
          _item(title: l(AppStrings.requestDeadlineTitle), value: eS_RODetail.Deadline),
          _item(title: '${l(AppStrings.requestStatus)} (*)', value: eS_RODetail.ROStatus),
        ]
    );
  }

  Widget _titleResponseInformation(LocalizationHelper l) {
    final listComponent = Lst_ES_ROComponent.map((e) => '${e.ComponentName} - ${e.ComponentCode}').join('\n');
    return IExpansionTile(
        title: l(AppStrings.requestActivityInformation),
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
        children: eS_RODetail.ROStatus != 'FINISH'
        ?[
          _itemTime(controller: _meetTimeController, title: l(AppStrings.requestMeetTimeTitle),),
          _itemTime(controller: _finishTimeController, title: '${l(AppStrings.requestExpiredDateTitle)} (*)'),
          _itemTextField(
              controller: _serialController,
              title: l(AppStrings.serialTitle),
              icon: FontAwesomeIcons.qrcode,
              onTap: () {
                saveLocalInformation();
                context.pushNamed(
                  EServiceUtils.getFullRouteName(QrCodeView.routeName),
                ).then((value) {
                  if (value != null) {
                    //_serialController.text = StringGenerate.extractQRCode(value.toString());
                    _serialController.text = value.toString();
                  }
                });
              }
          ),
          _itemListTextField(controller: _productController, title: l(AppStrings.productName), list: listProduct),
          _itemListTextField(controller: _errorTypeController, title: l(AppStrings.errorType), list: listErrorType),
          _itemMultiListTextField(controller: _listSysController, title: l(AppStrings.listComponents), list: listErrorComponent),
          _itemTextField(controller: _noteController, title: l(AppStrings.noteTitle), maxLine: 5, maxLength: 500),
        ]
        : [
          _item(title: l(AppStrings.requestTimeTitle), value: eS_RODetail.AppointmentDTimeUTC),
          _item(title: '${l(AppStrings.requestExpiredDateTitle)} (*)', value: eS_RODetail.FinishDTimeUser),
          _item(title: l(AppStrings.serialTitle), value: eS_RODetail.SerialNo),
          _item(title: l(AppStrings.productName), value: '${eS_RODetail.ProductName} - ${eS_RODetail.ProductCodeUser}'),
          _item(title: l(AppStrings.errorType), value: '${eS_RODetail.ErrorTypeName} - ${eS_RODetail.ErrorTypeCode}'),
          _item(title: l(AppStrings.listComponents), value: listComponent, maxLine: null),
          _item(title: l(AppStrings.noteTitle), value: eS_RODetail.Remark),
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
    IconData? icon,
    Function? onTap,
    int? maxLine,
    int? maxLength,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: ITextField(
                controller: controller,
                label: title,
                maxLines: maxLine,
                maxLength: maxLength,
              ),
            ),
            if (icon != null)
              const SizedBox(width: 16),
            if (icon != null)
              InkWell(
                onTap: () {
                  onTap!();
                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: AppColors.textWhiteColor,
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }

  Widget _itemListTextField({
    required TextEditingController controller,
    required String title,
    required List<String> list,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ISelectField(
          options: list,
          hintText: title,
          value: controller.text,
          onChanged: (value) {
            controller.text = value;
          },
        ),
      ],
    );
  }

  Widget _itemMultiListTextField({
    required TextEditingController controller,
    required String title,
    required List<String> list,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        IMultiSelectField<String>(
          options: list,
          selectedValues: controller.text.split('\n'),
          hintText: title,
          onChanged: (values) {
            controller.text = values!.join('\n').trim();
            final listComponent = values.join('\n').trim().split('\n');
            Lst_ES_ROComponent.clear();
            for (var i = 0; i < listComponent.length; i++) {
              final component = listComponent[i].split(' - ');
              if(component[0] != '') {
                Lst_ES_ROComponent.add(
                  ES_ROComponentModel(
                    ProductGrpCode: ProductGrpCode,
                    ComponentCode: component[1],
                    ComponentName: component[0],
                  ),
                );
              }
            }
          },
          getLabel: (value) => value,
        ),
      ],
    );
  }

  Widget _imageAreaBeforeInstall(LocalizationHelper l) {
    return IScrollImage(
      listFile: listFileBefore,
      listROAttachFile: Lst_ES_ROAttachFileBefore,
      flagGallery: true,
      flagCamera: true,
      flagDelete: true,
      title: l(AppStrings.requestImageBefore),
    );
  }

  Widget _imageAreaAfterInstall(LocalizationHelper l) {
    return IScrollImage(
      listFile: listFileAfter,
      listROAttachFile: Lst_ES_ROAttachFileAfter,
      flagGallery: true,
      flagCamera: true,
      flagDelete: true,
      title: l(AppStrings.requestImageAfter),
    );
  }
}
