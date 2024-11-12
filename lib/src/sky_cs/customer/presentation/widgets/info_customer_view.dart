import 'dart:convert';

import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/services/injection/injection_container.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_info.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/info_customer_view_cubit/info_customer_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class InfoCustomerView extends StatelessWidget {
  InfoCustomerView({required this.customer, super.key});

  final SKY_CustomerDetail customer;

  late SKY_CustomerInfo customerInfo;
  late List<dynamic> jsonCustomerInfo;
  late List<dynamic> jsonPartnerType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      InfoCustomerViewCubit(searchCustomerGroupUseCase: sl(), searchCustomerColumnUseCase: sl())
        ..init(),
      child: BlocConsumer<InfoCustomerViewCubit, InfoCustomerViewState>(
        listener: (context, state) {
          if(state is InfoCustomerViewLoaded) {
            customerInfo = customer.Lst_Mst_Customer.first;
            jsonCustomerInfo = jsonDecode(customerInfo.JsonCustomerInfo) as List<dynamic>;
            jsonPartnerType = jsonDecode(customerInfo.CustomerInPartnerTypeJson) as List<dynamic>;
          }
        },
        builder: (context, state) {
          if(state is InfoCustomerViewLoading){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.textWhiteColor,
              child: const LoadingView(),
            );
          }
          if(state is InfoCustomerViewLoaded){
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: state.listGroupFold.length,
                itemBuilder: (context, index) {
                  final group = state.listGroupFold[index];
                  final columns = state.listColumnFold
                      .where((col) => col.ColGrpCodeSys == group.ColGrpCodeSys)
                      .toList();
                  var isExpanded = false;

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return ExpansionTile(
                        initiallyExpanded: true,
                        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                        visualDensity: const VisualDensity(vertical: -4),
                        shape: const Border(),
                        trailing: isExpanded
                            ? SvgPicture.asset(AppMediaRes.iconExpandUp)
                            : SvgPicture.asset(AppMediaRes.iconExpandDown),
                        collapsedBackgroundColor: AppColors.greenLightColor,
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            isExpanded = expanded;
                          });
                        },
                        title: Text(
                          group.ColGrpName,
                          style: AppTextStyles.textStyleInterW500S14Black,
                        ),
                        children: columns.map((col) {
                          Widget inputWidget;
                          String? value;
                          final dynamicField;

                          if (col.ColCodeSys == 'CustomerName') {
                            value = customerInfo.CustomerName;
                          }
                          else if (col.ColCodeSys == 'CustomerCode') {
                            value = customerInfo.CustomerCode;
                          }
                          else if (col.ColCodeSys == 'CustomerType') {
                            value = customerInfo.CustomerType;
                          }
                          else if (col.ColCodeSys == 'PartnerType') {
                            dynamicField = jsonPartnerType.first;
                            value = dynamicField['Mst_PartnerType'][0]['PartnerTypeName'] as String? ?? '';
                          }
                          else {
                            dynamicField = jsonCustomerInfo.firstWhere(
                                  (info) => info['ColCodeSys'] == col.ColCodeSys,
                              orElse: () => null,
                            );
                            value = dynamicField?['ColValue'] as String? ?? '';
                          }


                          switch (col.ColDataType) {
                            case 'TEXT':
                              inputWidget = ITextField(
                                controller: TextEditingController(text: value),
                                label: col.ColCaption,
                                readOnly: true,
                              );
                            default:
                              inputWidget = ITextField(
                                controller: TextEditingController(text: value),
                                label: col.ColCaption,
                                readOnly: true,
                              );
                          }
                          return ListTile(
                            title: inputWidget,
                          );
                        }).toList(),
                      );
                    },
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
