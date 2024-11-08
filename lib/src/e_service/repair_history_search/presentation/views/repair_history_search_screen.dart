import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/inputs/i_text_field.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/strings.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/utils/string_generate.dart';
import '../../../guarantee_manage/domain/entities/es_warranty_detail.dart';
import '../../../guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';
import '../../../repair_manage/domain/entities/es_ro_detail.dart';
import '../cubit/repair_history_search_cubit/repair_history_search_cubit.dart';


class RepairHistorySearchScreen extends StatefulWidget {
  const RepairHistorySearchScreen({super.key});

  static const routeName = 'eservice/repair-history-search';

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
                return const Center(child: CircularProgressIndicator());
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
            hintText: AppStrings.scanProductCode,
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
            Navigator.pushNamed(
              context,
              'QrCodeView.routeName',
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
              Icons.qr_code,
              size: 28,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoHistorySearch(List<RT_ES_WarrrantyActivateByQR> listQr, List<ES_WarrantyDetail> listWarranty, List<ES_RODetail> listRO) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              context.read<RepairHistorySearchCubit>().init();
              _serialNoController.clear();
            },
            child: Container(
              height: 36,
              width: 48,
              decoration: const BoxDecoration(
                color: AppColors.buttonRedColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: const Icon(
                Icons.close,
                size: 20,
                color: AppColors.textWhiteColor,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Số serial: ${StringGenerate.extractQRCode(listQr[0].SerialNo)}',
              style: AppTextStyles.textStyleInterW400S16Black,
            ),
            Text(
              'Mã SP: ${listQr[0].ProductCodeUser}',
              style: AppTextStyles.textStyleInterW400S16Black,
            ),
            Text(
              'Tên SP: ${listQr[0].ProductName}',
              style: AppTextStyles.textStyleInterW400S16Black,
            ),
            const Divider(color: AppColors.divideColor,),
            if(listWarranty.isNotEmpty)...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      listWarranty[0].CreateDTimeUTC,
                      style: AppTextStyles.textStyleInterW400S16Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      listWarranty[0].CreateBy,
                      style: AppTextStyles.textStyleInterW400S14Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
            if(listWarranty.isNotEmpty)...[
              Text(
                'KH: ${listWarranty[0].CustomerName} - ${listWarranty[0].CustomerCodeSys}',
                style: AppTextStyles.textStyleInterW400S14Grey,
              ),
            ],
            if(listWarranty.isNotEmpty)...[
              Text(
                'DC: ${listWarranty[0].CustomerAddress}',
                style: AppTextStyles.textStyleInterW400S14Grey,
              ),
            ],
            if(listWarranty.isNotEmpty)...[
              const Divider(color: AppColors.divideColor,),
            ],
            if(listRO.isNotEmpty)...[
              Expanded(
                child: ListView.separated(
                  itemCount: listRO.length,
                  separatorBuilder: (context, index) => Container(height: 1, color: AppColors.divideColor,),
                  itemBuilder: (context, index) {
                    return _itemGuarantee(context, listRO[index]);
                  },
                ),
              ),
            ],
          ],
        ),
      ]
    );
  }

  Widget _itemGuarantee(BuildContext context, ES_RODetail roDetail) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.textWhiteColor,
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
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  roDetail.RONo,
                  style: AppTextStyles.textStyleInterW400S14Grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'KTV: ${roDetail.AgentName}',
                  style: AppTextStyles.textStyleInterW400S14Grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Ngày thực hiện: ${roDetail.AppointmentDTimeUTC}',
                  style: AppTextStyles.textStyleInterW400S14Grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
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

