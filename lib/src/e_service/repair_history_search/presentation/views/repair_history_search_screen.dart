import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/src/e_service/common/widgets/qr_code_view.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';
import 'package:ecore/src/e_service/repair_history_search/presentation/cubit/repair_history_search_cubit/repair_history_search_cubit.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepairHistorySearchScreen extends StatefulWidget {
  const RepairHistorySearchScreen({super.key});

  static const routeName = 'repair-history-search';

  @override
  State<RepairHistorySearchScreen> createState() =>
      _RepairHistorySearchScreenState();
}

class _RepairHistorySearchScreenState extends State<RepairHistorySearchScreen> {
  final TextEditingController _serialNoController = TextEditingController();

  @override
  void initState() {
    context.read<RepairHistorySearchCubit>().init();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<RepairHistorySearchCubit, RepairHistorySearchState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              if(state is RepairHistorySearchLoading) {
                return const LoadingView();
              }
              if(state is RepairHistorySearchLoaded) {
                return Center(
                  child: _scanner(),
                );
              }
              if(state is RepairHistorySearchSearched) {
                return _infoHistorySearch(state.listQr, state.listWarranty, state.listRO);
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
      AppStrings.repairHistorySearchTitle,
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
            hintText: 'Nhập số Serial',
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              value = _serialNoController.text;
              context.read<RepairHistorySearchCubit>().search(value);
            },
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            context.pushNamed(
              EServiceUtils.getFullRouteName(QrCodeView.routeName),
            ).then((value) {
              if (value != null) {
                _serialNoController.text = value.toString();
                context.read<RepairHistorySearchCubit>().search(
                    StringGenerate.extractQRCode(value.toString())
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
              FontAwesomeIcons.qrcode,
              size: 24,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoHistorySearch(List<RT_ES_WarrrantyActivateByQR> listQr, List<ES_WarrantyDetail> listWarranty, List<ES_RODetail> listRO) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Số serial: ${StringGenerate.extractQRCode(listQr[0].SerialNo)}',
          style: AppTextStyles.textStyleInterW400S16Black,
        ),
        const SizedBox(height: 4),
        Text(
          'Mã SP: ${listQr[0].ProductCodeUser}',
          style: AppTextStyles.textStyleInterW400S16Black,
        ),
        const SizedBox(height: 4),
        Text(
          'Tên SP: ${listQr[0].ProductName}',
          style: AppTextStyles.textStyleInterW400S16Black,
        ),
        // const Divider(color: AppColors.divideColor,),
        const SizedBox(height: 16),
        if(listWarranty.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.textBlueColor.withOpacity(0.1),
              border: Border.all(color: AppColors.textBlueColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        listWarranty[0].InstallationDTimeUTC,
                        style: AppTextStyles.textStyleInterW400S16Black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      listWarranty[0].AgentName,
                      style: AppTextStyles.textStyleInterW400S14Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'KH: ${listWarranty[0].CustomerName} - ${listWarranty[0].CustomerCode}',
                  style: AppTextStyles.textStyleInterW400S14Grey,
                ),
                const SizedBox(height: 8),
                Text(
                  'ĐC: ${listWarranty[0].CustomerAddress}',
                  style: AppTextStyles.textStyleInterW400S14Grey,
                ),
              ],
            ),
          ),
        if(listWarranty.isNotEmpty)...[
          // const Divider(color: AppColors.divideColor,),
          const SizedBox(height: 16),
        ],
        if(listRO.isNotEmpty)...[
          Expanded(
            child: ListView.separated(
              itemCount: listRO.length,
              separatorBuilder: (context, index) => Container(height: 8),
              itemBuilder: (context, index) {
                return _itemGuarantee(context, listRO[index]);
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _itemGuarantee(BuildContext context, ES_RODetail roDetail) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.textYellowColor.withOpacity(0.1),
        border: Border.all(color: AppColors.textYellowColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  roDetail.ReceptionDTimeUTC,
                  style: AppTextStyles.textStyleInterW500S16Black,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                roDetail.RONo,
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'KTV: ${roDetail.AgentName}',
                  style: AppTextStyles.textStyleInterW400S14Grey,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                roDetail.FinishDTimeUser,
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Cụm linh kiện lỗi: ${roDetail.ListComponentCode ?? ''}',
            style: AppTextStyles.textStyleInterW400S14Grey,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

