import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/inputs/i_expansion_tile.dart';
import 'package:ecore/core/common/widgets/inputs/i_multiselect_field.dart';
import 'package:ecore/core/common/widgets/inputs/i_select_field.dart';
import 'package:ecore/core/common/widgets/inputs/i_select_time.dart';
import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_detail_cubit/customer_detail_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_component_model.dart';
import 'package:ecore/src/e_service/repair_manage/data/model/es_ro_edit_model.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_attach_file.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_component.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/cubit/repair_edit_cubit/repair_edit_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../common/widgets/i_scroll_image.dart';

class RepairEditScreen extends StatefulWidget {
  const RepairEditScreen({required this.id, super.key});

  static const routeName = '/repair-edit';
  final String id;

  @override
  State<RepairEditScreen> createState() => _RepairEditScreenState();
}

class _RepairEditScreenState extends State<RepairEditScreen> {
  final TextEditingController _meetTimeController = TextEditingController();
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
  late List<String> listErrorComponent;

  DateTime? selectedDate;

  void saveLocalInformation() {
    eS_RODetail
      ..AppointmentDTimeUTC = _meetTimeController.text
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
    return BlocConsumer<RepairEditCubit, RepairEditState>(
      listener: (context, state) {
        if (state is RepairEditLoaded) {
          eS_RODetail = state.eS_RODetail;
          Lst_ES_ROComponent = state.Lst_ES_ROComponent as List<ES_ROComponentModel>;
          Lst_ES_ROAttachFile = state.Lst_ES_ROAttachFile;
          listErrorType = state.listErrorType;
          listProduct = state.listProduct;
          listErrorComponent = state.listErrorComponent;

          _serialController.text = eS_RODetail.SerialNo;

          _errorTypeController.text = eS_RODetail.ErrorTypeCode;
          _productController.text = eS_RODetail.ProductCode;
          _listSysController.text = state.Lst_ES_ROComponent.map((e) => '${e.ProductGrpCode}-${e.ComponentCode}').join(' ');

          _meetTimeController.text = state.eS_RODetail.AppointmentDTimeUTC;
          _noteController.text = state.eS_RODetail.Remark;

          Lst_ES_ROAttachFileBefore = state.Lst_ES_ROAttachFile.where((element) => element.ROAttachFileType == '0').toList();
          Lst_ES_ROAttachFileAfter = state.Lst_ES_ROAttachFile.where((element) => element.ROAttachFileType == '1').toList();
        }
        if (state is RepairEditSuccess) {
          Navigator.of(context).pushReplacementNamed('/repair-manage');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sửa thành công!'),
            ),
          );
        }
        if (state is RepairFinishSuccess) {
          Navigator.of(context).pushReplacementNamed('/repair-manage');
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
        if (state is RepairEditError) {
          return Center(child: Text(state.message));
        }
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
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.textWhiteColor,
                ),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
              title: _textTitle(),
              actions: [
                if(eS_RODetail.ROStatus != 'FINISH')
                  InkWell(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    onTap: () {
                      final es_ROEdit = ES_ROEditModel(
                        OrgID: eS_RODetail.OrgID ?? '',
                        RONo: eS_RODetail.RONo ?? '',
                        ReceptionDTimeUTC: eS_RODetail.ReceptionDTimeUTC ?? '',
                        CustomerCodeSys: eS_RODetail.CustomerCodeSys ?? '',
                        CustomerName: eS_RODetail.CustomerName ?? '',
                        CustomerPhoneNo: eS_RODetail.CustomerPhoneNo ?? '',
                        CustomerAddress: eS_RODetail.CustomerAddress ?? '',
                        AgentCode: eS_RODetail.AgentCode ?? '',
                        RODesc: eS_RODetail.RODesc ?? '',
                        Deadline: eS_RODetail.Deadline ?? '',
                        ProductCode: _productController.text,
                        SerialNo: eS_RODetail.SerialNo,
                        FactoryCode: eS_RODetail.FactoryCode ?? '',
                        ErrorTypeCode: _errorTypeController.text,
                        ROStatus: eS_RODetail.ROStatus ?? '',
                        AppointmentDTimeUTC: _meetTimeController.text,
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
                if(eS_RODetail.ROStatus != 'FINISH')
                  InkWell(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    onTap: () {
                      final currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
                      IDialog.showConfirmFinishDialog(
                        context,
                        AppStrings.confirmFinishTitle,
                      ).then((value) {
                        if (value != null && value == true) {
                          context.read<RepairEditCubit>().finish(eS_RODetail.RONo, currentTime, eS_RODetail.AgentCode);
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
                        Icons.done,
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
      AppStrings.repairRequestEditTitle,
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
          _item(title: '${AppStrings.requestTimeTitle} (*)', value: eS_RODetail.ReceptionDTimeUTC),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _item(title: '${AppStrings.customerNameTitle} (*)', value: eS_RODetail.CustomerName)),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/customer-detail', arguments: eS_RODetail.CustomerCodeSys);
                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Icon(
                    Icons.info,
                    size: 28,
                    color: AppColors.textWhiteColor,
                  ),
                ),
              ),
            ],
          ),
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
          _item(title: '${AppStrings.repairStaffName} (*)', value: eS_RODetail.AgentName),
          _item(title: AppStrings.requestDescription, value: eS_RODetail.RODesc, maxLine: 4),
          _item(title: AppStrings.requestDeadlineTitle, value: eS_RODetail.Deadline),
          _item(title: '${AppStrings.requestStatus} (*)', value: eS_RODetail.ROStatus),
        ]
    );
  }

  Widget _titleResponseInformation() {
    return IExpansionTile(
        title: AppStrings.requestActivityInformation,
        trailingExpansionTrue: SvgPicture.asset(AppMediaRes.iconExpandUp),
        trailingExpansionFalse: SvgPicture.asset(AppMediaRes.iconExpandDown),
        children: [
          _itemTime(controller: _meetTimeController, title: AppStrings.requestMeetTimeTitle,),
          _item(title: '${AppStrings.requestExpiredDateTitle} (*)', value: eS_RODetail.FinishDTimeUser),
          _itemTextField(
              controller: _serialController,
              title: AppStrings.serialTitle,
              icon: Icons.qr_code,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  'QrCodeView.routeName',
                ).then((value) {
                  if (value != null) {
                    //_serialController.text = StringGenerate.extractQRCode(value.toString());
                    _serialController.text = value.toString();
                  }
                });
              }
          ),
          _itemListTextField(controller: _productController, title: AppStrings.productName, list: listProduct),
          _itemListTextField(controller: _errorTypeController, title: AppStrings.errorType, list: listErrorType),
          _itemMultiListTextField(controller: _listSysController, title: AppStrings.listComponents, list: listErrorComponent),
          _itemTextField(controller: _noteController, title: AppStrings.noteTitle, maxLine: 5, maxLength: 500),
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
                    size: 28,
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
          selectedValues: controller.text.split(' '),
          hintText: title,
          onChanged: (values) {
            controller.text = values!.join(' ').trim();
            final listComponent = values.join(' ').trim().split(' ');
            Lst_ES_ROComponent.clear();
            for (var i = 0; i < listComponent.length; i++) {
              final component = listComponent[i].split('-');
              Lst_ES_ROComponent.add(
                ES_ROComponentModel(
                  ComponentCode: component[1],
                  ProductGrpCode: component[0],
                ),
              );
            }
          },
          getLabel: (value) => value,
        ),
      ],
    );
  }

  Widget _imageAreaBeforeInstall() {
    return IScrollImage(
      listFile: listFileBefore,
      listROAttachFile: Lst_ES_ROAttachFileBefore,
      flagGallery: true,
      flagCamera: true,
      flagDelete: true,
      title: AppStrings.requestImageBefore,
    );
  }

  Widget _imageAreaAfterInstall() {
    return IScrollImage(
      listFile: listFileAfter,
      listROAttachFile: Lst_ES_ROAttachFileAfter,
      flagGallery: true,
      flagCamera: true,
      flagDelete: true,
      title: AppStrings.requestImageAfter,
    );
  }
}
