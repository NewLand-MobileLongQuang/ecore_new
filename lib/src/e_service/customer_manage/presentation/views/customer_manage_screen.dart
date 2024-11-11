import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';

import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_manage_cubit/customer_manage_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';

class CustomerManageScreen extends StatefulWidget {
  const CustomerManageScreen({super.key});

  static const routeName = 'customer-manage';

  @override
  State<CustomerManageScreen> createState() => _CustomerManageScreenState();
}

class _CustomerManageScreenState extends State<CustomerManageScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CustomerManageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(CustomerManageScreen.routeName);

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            const SizedBox(height: 16),
            _listCustomer(context),
          ],
        ),
      ),
    );
  }

  Widget _textTitle(LocalizationHelper l) {
    return Text(
      l(AppStrings.chooseCustomer),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: ITextField(
            controller: _searchController,
            hintText: AppStrings.search,
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            context.read<CustomerManageCubit>().search(_searchController.text);
          },
          child: Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _listCustomer(BuildContext context) {
    return Expanded(
        child: BlocConsumer<CustomerManageCubit, CustomerManageState>(
          listener: (context, state) {
            if(state is CustomerManageGetSuccess){
              Navigator.of(context).pop(state.customer);
            }
          },
          builder: (context, state) {
            if(state is CustomerManageLoading){
              return const LoadingView();
            }
            if(state is CustomerManageError){
              return Center(
                child: Text(state.message),
              );
            }
            if(state is CustomerManageLoaded){
              final listCustomer = state.listCustomer;
              return ListView.separated(
                  itemCount: listCustomer.length,
                  separatorBuilder: (context, index) => Container(height: 1, color: AppColors.divideColor,),
                  itemBuilder: (context, index) {
                    return _itemCustomer(context, state.listCustomer[index]);
                  }
              );
            }
            return const SizedBox();
          },
        )
    );
  }

  Widget _itemCustomer(BuildContext context, ES_Customer eS_Customer) {
    return InkWell(
      onTap: (){
        context.read<CustomerManageCubit>().chooseCustomer(eS_Customer);
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
            if(eS_Customer.CustomerAvatarPath != '')...[
              CircleAvatar(
                backgroundImage: NetworkImage(eS_Customer.CustomerAvatarPath),
              ),
            ],
            if(eS_Customer.CustomerAvatarPath == '')...[
              CircleAvatar(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    StringGenerate.getCurrentName(eS_Customer.CustomerName).toUpperCase(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                        '${eS_Customer.CustomerName} - ${eS_Customer.CustomerCode}',
                        style: AppTextStyles.textStyleInterW400S16Black,
                        overflow: TextOverflow.ellipsis
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      eS_Customer.CustomerPhoneNo,
                      style: AppTextStyles.textStyleInterW400S14Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      eS_Customer.CustomerAddress,
                      style: AppTextStyles.textStyleInterW400S14Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
