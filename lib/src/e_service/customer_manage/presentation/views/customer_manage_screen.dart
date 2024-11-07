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

import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';

class CustomerManageScreen extends StatefulWidget {
  const CustomerManageScreen({super.key});

  static const routeName = '/customer-manage';

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

  Widget _textTitle() {
    return Text(
      AppStrings.chooseCustomer,
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
        ElevatedButton(
          onPressed: () {
            context.read<CustomerManageCubit>().search(_searchController.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size(64, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          child: const Icon(
            Icons.search,
            color: AppColors.textWhiteColor,
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
