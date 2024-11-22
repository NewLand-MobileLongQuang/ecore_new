import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/common/widgets/inputs/i_select_date.dart';
import '../../../../../core/common/widgets/inputs/i_select_field.dart';
import '../../../../../core/common/widgets/inputs/i_select_time.dart';
import '../../../../../core/common/widgets/inputs/i_text_field.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/media_res.dart';
import '../../../../../core/res/strings.dart';
import '../cubit/eTicket_create_cubit/eTicket_create_cubit.dart';

class eTicketCreateScreen extends StatefulWidget {
  const eTicketCreateScreen({super.key});
  static const routeName = '/eTicket_create';

  @override
  State<eTicketCreateScreen> createState() => _eTicketCreateScreenState();
}

class _eTicketCreateScreenState extends State<eTicketCreateScreen> {
  @override
  void initState() {
    super.initState();
    context.read<eTicketCreateCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            AppStrings.eTicketcreate,
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Thông tin chính'),
              Tab(text: 'Thông tin bổ sung'),
            ],
            labelColor: AppColors.greenLightColor,
            unselectedLabelColor: AppColors.textBlackColor,
          ),
          actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: AppColors.textWhiteColor,
            ),
            onPressed: () {
              _saveData(context);
            },
          ),
        ],
        ),
        body: TabBarView(
          children: [
            _listRepair(context, groupIndex: 0),
            _listRepair(context, groupIndex: 1),
          ],
        ),

      ),
    );
  }

  Widget _listRepair(BuildContext context, {required int groupIndex}) {
    return BlocConsumer<eTicketCreateCubit, eTicketCreateState>(
      listener: (context, state) {
        if (state is eTicketCreateStateSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is eTicketCreateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is eTicketCreateStateError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is eTicketCreateStateSuccess) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.textWhiteColor,
          );
        }

        final cubit = context.read<eTicketCreateCubit>();
        state as eTicketCreateStateLoaded;

        return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            final group = state.gettemtpl.Lst_ET_MetaColGroup[groupIndex];
            final columns = state.gettemtpl.Lst_ET_MetaColGroupSpec
                .where((col) => col.TicketColGrpCode == group.TicketColGrpCode)
                .toList()
              ..sort((a, b) => a.OrderIdx.compareTo(b.OrderIdx)); // Sort by OrderIdx
            if (groupIndex == 0) {
              columns.sort((a, b) => a.OrderIdx.compareTo(b.OrderIdx));
            }
            final templt = state.listETAlltemplateFold;
            final lsttags = state.listETMstTagsFold.Lst_Mst_Tag;
            final lstderpartment = state.listETDepartmentFold.Lst_Mst_Department;
            final lstOrg = state.listETOrgFold.Lst_Mst_Org
                .where((col) => col.OrgID == "7206207001");
            final lstPriority = state.listETTicketPriorityFold.Lst_Mst_Priority
                .where((col) => col.OrgID == "7206207001");
            final lstSource = state.listETTicketSourceFold.Lst_Mst_TicketSource
                .where((col) => col.OrgID == "7206207001");
            final lstStatus = state.listETTicketStatusFold.Lst_Mst_TicketStatus
                .where((col) => col.OrgID == "7206207001");
            final lstReceptionChannel = state.listETReceptionChannelFold.Lst_Mst_ReceptionChannel
                .where((col) => col.OrgID == "7206207001");
            final lstTicketType = state.listETicketTypeFold.Lst_Mst_TicketType
                .where((col) => col.OrgID == "7206207001");
            final lstCustomType = state.listETCustomTypeFold.Lst_Mst_TicketCustomType
                .where((col) => col.OrgID == "7206207001");
            final lstcus= state.listETcusFold;
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
                  title: Text(""),
                  children:
                  columns.map((col) {
                    Widget inputWidget = const SizedBox();
                    final controller = cubit.controllers[col.ColCode];
                      switch (col.ColDataType) {
                      case 'TEXT':
                        inputWidget = ITextField(
                          controller: controller,
                          label: col.ColCaption,
                        );
                        break;
                      case 'DATETIME':
                        inputWidget = DateTimePickerField(
                          label: col.ColCaption,
                          controller: controller,
                        );
                        break;
                      case 'TEXTAREA':
                        inputWidget = ITextField(
                          controller: controller,
                          label: col.ColCaption,
                          maxLines: 3,
                        );
                      break;
                        case 'MASTERDATA':
                          {switch (col.ColCode){
                            case 'TicketType':
                              inputWidget = ISelectField<String>(
                                options: lstTicketType
                                    .where((option) => option.TicketType != null) // Ensure non-null options
                                    .map((option) => option.CustomerTicketTypeName) // Default for null values
                                    .toList(),
                                value: controller?.text ?? '', // Use empty string if controller or text is null
                                hintText: col.ColCaption ?? '', // Provide a fallback for hintText if needed
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                },
                                getLabel: (value) => value,
                              );
                              break;
                            case 'DepartmentCode':
                              inputWidget = ISelectField<String>(
                                options: lstderpartment
                                    .where((option) => option.DepartmentCode != null)
                                    .map((option) => option.DepartmentName)
                                    .toList(),
                                value: controller?.text ?? '',
                                hintText: col.ColCaption ?? '',
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                  //cubit.getListAgentOption(value!);
                                },
                                getLabel: (value) => value,
                              );
                              break;
                            case 'OrgID':
                              inputWidget = ISelectField<String>(
                                options: lstOrg
                                    .where((option) => option.OrgID != null)
                                    .map((option) => option.mnnt_NNTFullName)
                                    .toList(),
                                value: controller?.text ?? '',
                                hintText: col.ColCaption ?? '',
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                },
                                getLabel: (value) => value,
                              );
                              break;
                            case 'TicketPriority':
                              inputWidget = ISelectField<String>(
                                options: lstPriority
                                    .where((option) => option.TicketPriority != null) // Ensure non-null options
                                    .map((option) => option.CustomerTicketPriorityName) // Default for null values
                                    .toList(),
                                value: controller?.text ?? '',
                                hintText: col.ColCaption ?? '',
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                },
                                getLabel: (value) => value,
                              );
                              break;
                            case 'TicketStatus':
                              inputWidget = ISelectField<String>(
                                options: lstStatus
                                    .where((option) => option.TicketStatus != null) // Ensure non-null options
                                    .map((option) => option.CustomerTicketStatusName) // Default for null values
                                    .toList(),
                                value: controller?.text ?? '',
                                hintText: col.ColCaption ?? '',
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                },
                                getLabel: (value) => value,
                              );
                              break;
                            case 'ReceptionChannel':
                              inputWidget = ISelectField<String>(
                                options: lstReceptionChannel
                                    .where((option) => option.ReceptionChannel != null) // Ensure non-null options
                                    .map((option) => option.CustomerReceptionChannelName) // Default for null values
                                    .toList(),
                                value: controller?.text ?? '',
                                hintText: col.ColCaption ?? '',
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                },
                                getLabel: (value) => value,
                              );
                              break;
                            case 'Tags':
                              inputWidget = ISelectField<String>(
                                options: lsttags
                                    .where((option) => option.TagID != null) // Ensure non-null options
                                    .map((option) => option.TagDesc) // Default for null values
                                    .toList(),
                                value: controller?.text ?? '',
                                hintText: col.ColCaption ?? '',
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                },
                                getLabel: (value) => value,
                              );
                              break;
                              case 'TicketCustomType':
                              inputWidget = ISelectField<String>(
                                options: lstCustomType
                                    .where((option) => option.TicketCustomType != null) // Ensure non-null options
                                    .map((option) => option.CustomerTicketCustomTypeName) // Default for null values
                                    .toList(),
                                value: controller?.text ?? '',
                                hintText: col.ColCaption ?? '',
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                },
                                getLabel: (value) => value,
                              );
                              break;
                              case 'TicketSource':
                              inputWidget = ISelectField<String>(
                                options: lstSource
                                    .where((option) => option.TicketSource != null)
                                    .map((option) => option.CustomerTicketSourceName)
                                    .toList(),
                                value: controller?.text ?? '',
                                hintText: col.ColCaption ?? '',
                                onChanged: (value) {
                                  if (controller != null) {
                                    controller.text = value ?? '';
                                  }
                                },
                                getLabel: (value) => value,
                              );
                            case 'CusCode':
                              inputWidget = Row(
                                children: [
                                  Expanded(
                                    child: ISelectField<String>(
                                      options: lstcus
                                          .where((option) => option.CustomerCode != null)
                                          .map((option) => option.CustomerName)
                                          .toList(),
                                      value: controller?.text ?? '',
                                      hintText: col.ColCaption,
                                      onChanged: (value) {
                                        if (controller != null) {
                                          controller.text = value ?? '';
                                        }
                                      },
                                      //getLabel: (value) => value,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/customer-skycs-create');
                                    },
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: AppColors.textWhiteColor,
                                        size: 20, 
                                      ),
                                    ),
                                  ),
                                ],
                              );
                              break;

                            default:
                              inputWidget = ITextField(
                                controller: controller,
                                label: col.ColCaption,
                              );
                              break;
                          }
                          }
                          break;

                        default:
                        inputWidget = ITextField(
                          controller: controller,
                          label: col.ColCaption,
                        );
                        break;
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
    );
  }



  void _saveData(BuildContext context) {
    final cubit = context.read<eTicketCreateCubit>();
    cubit.validateAndSave(context);
  }
}
