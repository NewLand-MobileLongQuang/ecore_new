import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/services/injection/injection_container.dart';
import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/sky_cs/common/sky_cs_context_extensions.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/customer_skycs_manage_cubit/customer_skycs_manage_cubit.dart';
import 'package:ecore/src/sky_cs/customer/presentation/views/customer_skycs_create_screen.dart';
import 'package:ecore/src/sky_cs/customer/presentation/views/customer_skycs_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../domain/entities/sky_customer_info.dart';


class CustomerSkyCSManageScreen extends StatelessWidget {
  const CustomerSkyCSManageScreen({super.key});

  static const routeName = 'customer-skycs-manage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerSkyCSManageCubit(searchCustomerSkyCSUseCase: sl(), deleteCustomerUseCase: sl())..init(),
      child: const CustomerSkyCSManageUIScreen(),
    );
  }
}

class CustomerSkyCSManageUIScreen extends StatefulWidget {
  const CustomerSkyCSManageUIScreen({super.key});

  @override
  State<CustomerSkyCSManageUIScreen> createState() => _CustomerSkyCSManageUIScreenState();
}

class _CustomerSkyCSManageUIScreenState extends State<CustomerSkyCSManageUIScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmptyData = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        context.read<CustomerSkyCSManageCubit>().loadMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(CustomerSkyCSManageScreen.routeName);
    
    return Scaffold(
      appBar: _buildAppBar(l),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(context),
            const SizedBox(height: 16),
            _buildCustomerList(),
            _buildAddButton(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(LocalizationHelper l) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        icon: const Icon(
          FontAwesomeIcons.chevronLeft,
          color: AppColors.textWhiteColor,
          size: 20,
        ),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text(
        l(AppStrings.manageCustomer),
        style: AppTextStyles.textStyleInterW500S18White,
        maxLines: 2,
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
              if(value.isEmpty) {
                context.read<CustomerSkyCSManageCubit>().init();
              }
            },
            onSubmitted: (value) {
              context.read<CustomerSkyCSManageCubit>().search(_searchController.text);
            },
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              filled: true,
              fillColor: Colors.green[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              suffixIcon: isEmptyData
                  ? PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) =>
                [
                  PopupMenuItem(
                    child: const Text('Tìm kiếm nâng cao'),
                    onTap: () {
                     // Navigator.pushNamed(context, '/advanced-search');
                    },
                  ),
                ],
              )
                  : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    isEmptyData = true;
                  });
                  context.read<CustomerSkyCSManageCubit>().init();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerList() {
    return Expanded(
      child: BlocConsumer<CustomerSkyCSManageCubit, CustomerSkyCSManageState>(
        listener: (context, state) {
          if (state is CustomerSkyCSManageDeleteSuccess) {
            context.read<CustomerSkyCSManageCubit>().init();
          }
          if (state is CustomerSkyCSManageError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.textRedColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CustomerSkyCSManageLoading) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.textWhiteColor,
              child: const LoadingView(),
            );
          }
          if (state is CustomerSkyCSManageLoaded) {
            final listCountCheck = state.listPress.where((element) => element == true).toList().length;
            return Column(
              children: [
                if(listCountCheck > 0)...[
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.textWhiteColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Đã chọn $listCountCheck',
                          style: AppTextStyles.textStyleInterW400S16Black,
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CustomerSkyCSManageCubit>().deleteCustomer();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.textRedColor,
                            minimumSize: const Size(60, 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Icon(
                            size: 20,
                            Icons.delete,
                            color: AppColors.textWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.listCustomer.length,
                          separatorBuilder: (context, index) => const Divider(color: AppColors.divideColor),
                          itemBuilder: (context, index) {
                            return _customerItem(
                              customer: state.listCustomer[index],
                              isPress: state.listPress[index],
                              index: index,
                            );
                          },
                        ),
                        if(state is CustomerSkyCSManageLoadingMore)...[
                          const LoadingView(),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text('No customers found'),
          );
        },
      ),
    );
  }

  Widget _buildAddButton() {
    return Row(
      children: [
        Expanded(child: Container()),
        InkWell(
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          onTap: () {
            context.pushNamed(
              CustomerSkyCSCreateScreen.routeName,
            ).then((value) {
              if (value != null && value == true) {
                context.read<CustomerSkyCSManageCubit>().init();
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: const Icon(
              FontAwesomeIcons.plus,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _customerItem({
    required SKY_CustomerInfo customer,
    required bool isPress,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          CustomerSkyCSDetailScreen.routeName,
          arguments: {
            'CustomerCodeSys': customer.CustomerCodeSys,
          },
        );
      },
      onLongPress: () {
        context.read<CustomerSkyCSManageCubit>().chooseCustomer(index);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.textWhiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPress) SizedBox(
              height: 40,
              width: 40,
              child: SvgPicture.asset(AppMediaRes.iconDoneSlide),
            )
            else CircleAvatar(
              radius: 20,
              child: Text(
                StringGenerate.getCurrentName(customer.CustomerName).toUpperCase(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          customer.CustomerName,
                          style: AppTextStyles.textStyleInterW400S16Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        customer.CustomerCode,
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          customer.CustomerPhoneNo,
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        customer.CustomerEmail,
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}