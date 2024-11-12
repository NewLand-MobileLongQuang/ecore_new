import 'package:ecore/core/common/widgets/inputs/i_multiselect_field.dart';
import 'package:ecore/core/common/widgets/inputs/i_radio_button.dart';
import 'package:ecore/core/common/widgets/inputs/i_select_date.dart';
import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/src/sky_cs/common/sky_cs_context_extensions.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_option_value.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/customer_skycs_create_cubit/customer_skycs_create_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerSkyCSCreateScreen extends StatefulWidget {
  const CustomerSkyCSCreateScreen({super.key});

  static const routeName = 'customer-skycs-create';

  @override
  State<CustomerSkyCSCreateScreen> createState() =>
      _CustomerSkyCSCreateScreenState();
}

class _CustomerSkyCSCreateScreenState extends State<CustomerSkyCSCreateScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CustomerSkyCSCreateCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(CustomerSkyCSCreateScreen.routeName);

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
            onTap: () {
              _saveData(context); // Call saveData function in cubit
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _listRepair(context, l),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textTitle(LocalizationHelper l) {
    return Text(
      l(AppStrings.createCustomer),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _listRepair (BuildContext context, LocalizationHelper l) {
    return Expanded(
      child: BlocConsumer<CustomerSkyCSCreateCubit, CustomerSkyCSCreateState>(
        listener: (context, state) {
          if(state is CustomerSkyCSCreateSuccess){
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if(state is CustomerSkyCSCreateLoading){
            return const LoadingView();
          }
          if(state is CustomerSkyCSCreateError){
            return Center(
              child: Text(state.message),
            );
          }
          if(state is CustomerSkyCSCreateSuccess){
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColors.textWhiteColor,
            );
          }
          final cubit = context.read<CustomerSkyCSCreateCubit>();
          state as CustomerSkyCSCreateLoaded;
          return ListView.builder(
            itemCount: state.listGroupFold.length,
            itemBuilder: (context, index) {
              final group = state.listGroupFold[index];
              final columns = state.listColumnFold
                  .where((col) => col.ColGrpCodeSys == group.ColGrpCodeSys)
                  .toList();
              bool isExpanded = false;

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
                      l(group.ColGrpName),
                      style: AppTextStyles.textStyleInterW500S14Black,
                    ),
                    children: columns.map((col) {
                      Widget inputWidget;
                      final controller = cubit.controllers[col.ColCodeSys];
                      switch (col.ColDataType) {
                        case 'SELECTONEDROPDOWN':
                          // inputWidget = ISelectField<String>(
                          //   options: col.mdmc_JsonListOption.map((option) {
                          //     return option.Value;
                          //   }).toList(),
                          //   value: controller!.text,
                          //   hintText: col.ColCaption,
                          //   onChanged: (value) {
                          //     controller.text = value ?? '';
                          //                               },
                          //   getLabel: (value) => value,
                          // );
                        case 'CUSTOMERTYPE':
                          // final options = listcustype.Lst_Mst_CustomerType.map((option) {
                          //   return option.CustomerType;
                          // }).toList();
                          // controller!.text = options.first;
                          // inputWidget = ISelectField<String>(
                          //   options: options,
                          //   value: controller.text,
                          //   hintText: col.ColCaption,
                          //   onChanged: (value) {
                          //     controller.text = value ?? '';
                          //   },
                          //   getLabel: (value) => value,
                          // );
                        case 'PARTNERTYPE':
                          // final options = Listparnertype.map((option) {
                          //   return option.PartnerType;
                          // }).toList();
                          // controller!.text = options.first;
                          // inputWidget = ISelectField<String>(
                          //   options: Listparnertype.map((option) {
                          //     return option.PartnerType;
                          //   }).toList(),
                          //   value: controller.text,
                          //   hintText: col.ColCaption,
                          //   onChanged: (value) {
                          //     controller.text = value ?? '';
                          //                               },
                          //   getLabel: (value) => value,
                          // );
                        case 'ZALOUSERFOLLOWER':
                          // inputWidget = ISelectField<String>(
                          //   options: listZalo.map((option) {
                          //     return option.display_name;
                          //   }).toList(),
                          //   value: controller!.text,
                          //   hintText: col.ColCaption,
                          //   onChanged: (value) {
                          //     controller.text = value ?? '';
                          //                               },
                          //   getLabel: (value) => value,
                          // );
                        case 'TEXT':
                          if(state is CustomerSkyCSCreateCheck && col.FlagIsNotNull == '1' && controller!.text.isEmpty){
                            inputWidget = ITextField(
                              controller: controller,
                              label: l(col.ColCaption),
                              colorBorder: AppColors.buttonRedColor,
                            );
                          }
                          else {
                            inputWidget = ITextField(
                              controller: controller,
                              label: l(col.ColCaption),
                            );
                          }
                        case 'SELECTONERADIO':
                          inputWidget = IRadioButton(
                            contents: col.mdmc_JsonListOption
                                .map((option) => option.Value)
                                .toList(),
                            value: controller!.text,
                          );
                        case 'DATE':
                          inputWidget = DatePickerField(
                            label: l(col.ColCaption),
                            controller: controller,
                          );
                        case 'TEXTAREA':
                          inputWidget = ITextField(
                            controller: controller,
                            label: l(col.ColCaption),
                            maxLines: 3,
                          );
                        case 'MASTERDATA':
                          // inputWidget = FutureBuilder<List<SKY_OptionValue>>(
                          //   future: cubit.getListOption(col.ColCodeSys),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState ==
                          //         ConnectionState.waiting) {
                          //       return const Center(
                          //         child: CircularProgressIndicator(),
                          //       );
                          //     }
                          //     if (snapshot.hasError) {
                          //       return Center(
                          //         child: Text('Error: ${snapshot.error}'),
                          //       );
                          //     }
                          //     final options = snapshot.data ?? [];
                          //     // return ISelectField<String>(
                          //     //   options: options.map((option) => option.Value).toList(),
                          //     //   value: controller!.text,
                          //     //   hintText: col.ColCaption,
                          //     //   onChanged: (value) {
                          //     //     controller.text = value ?? '';
                          //     //                                   },
                          //     //   getLabel: (value) => value,
                          //     // );
                          //   },
                          // );
                        case 'MASTERDATASELECTMULTIPLE':
                          inputWidget = FutureBuilder<List<SKY_OptionValue>>(
                            future: cubit.getListOption(col.ColCodeSys),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              }
                              final options = snapshot.data ?? [];
                              final controller = cubit.controllers[col.ColCodeSys];

                              final selectedValues = (controller!.text.isNotEmpty)
                                  ? controller.text.split(',').map((e) => e.trim()).toList()
                                  : <String>[];

                              return IMultiSelectField<String>(
                                options: options.map((option) => option.Value).toList(),
                                selectedValues: selectedValues,
                                hintText: col.ColCaption,
                                onChanged: (values) {
                                  controller.text = values!.join(',');
                                                                },
                                getLabel: (value) => value,
                              );
                            },
                          );
                        default:
                          if(state is CustomerSkyCSCreateCheck && col.FlagIsNotNull == '1' && controller!.text.isEmpty){
                            inputWidget = ITextField(
                              controller: controller,
                              label: l(col.ColCaption),
                              colorBorder: AppColors.buttonRedColor,
                            );
                          }
                          else {
                            inputWidget = ITextField(
                              controller: controller,
                              label: l(col.ColCaption),
                            );
                          }
                      }
                      return ListTile(
                        title: inputWidget,
                      );
                    }).toList(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
  void _saveData(BuildContext context) {
    final cubit = context.read<CustomerSkyCSCreateCubit>();
    cubit.validateAndSave(context);
  }
}
