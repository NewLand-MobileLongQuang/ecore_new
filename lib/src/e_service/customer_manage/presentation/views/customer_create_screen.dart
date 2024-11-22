import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/utils/localization_helper.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/src/e_service/customer_manage/data/models/rq_es_customer_model.dart';
import 'package:ecore/src/e_service/customer_manage/presentation/cubit/customer_create_cubit/customer_create_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/text_styles.dart';

class CustomerCreateScreen extends StatefulWidget {
  const CustomerCreateScreen({super.key});

  static const routeName = 'customer-create';

  @override
  State<CustomerCreateScreen> createState() => _CustomerCreateScreenState();
}

class _CustomerCreateScreenState extends State<CustomerCreateScreen> {
  final TextEditingController _customerCodeController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerAddressController = TextEditingController();
  final TextEditingController _customerPhoneNoController = TextEditingController();
  final TextEditingController _customerEmailController = TextEditingController();

  @override
  void initState() {
    context.read<CustomerCreateCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(CustomerCreateScreen.routeName);

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
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
            onTap: (){
              final customer = RQ_ES_CustomerModel(
                CustomerCode: _customerCodeController.text,
                CustomerName: _customerNameController.text,
                CustomerAddress: _customerAddressController.text,
                CustomerPhoneNo: _customerPhoneNoController.text,
                CustomerEmail: _customerEmailController.text,
              );
              context.read<CustomerCreateCubit>().create(customer);
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
          child: BlocConsumer<CustomerCreateCubit, CustomerCreateState>(
            listener: (context, state) {
              if (state is CustomerCreateLoaded) {
                _customerCodeController.text = state.customerCodeSys;
                _customerNameController.text = '';
                _customerAddressController.text = '';
                _customerPhoneNoController.text = '';
                _customerEmailController.text = '';
              }
              if(state is CustomerCreateSuccess){
                Navigator.of(context).maybePop(state.customer);
              }
              if(state is CustomerCreateError) {
               IDialog.showNotificationDialog(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is CustomerCreateLoading) {
                return const LoadingView();
              }
              if (state is CustomerCreateLoaded) {
                return ListView(
                  children: [
                    _titleCustomerInformation(l),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _textTitle(LocalizationHelper l) {
    return Text(
      l(AppStrings.createCustomer),
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _titleCustomerInformation(LocalizationHelper l) {
    return Column(
      children: [
        _itemTextField(controller: _customerCodeController, title: l(AppStrings.customerIdTitle)),
        _itemTextField(controller: _customerNameController, title: l(AppStrings.customerNameTitle)),
        _itemTextField(controller: _customerAddressController, title: l(AppStrings.customerAddressTitle)),
        _itemTextField(controller: _customerPhoneNoController, title: l(AppStrings.customerPhoneTitle)),
        _itemTextField(controller: _customerEmailController, title: l(AppStrings.customerEmailTitle)),
      ],
    );
  }

  Widget _itemTextField({required TextEditingController controller ,required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ITextField(
                controller: controller,
                label: title,
              ),
            ),
          ],
        )
      ],
    );
  }
}
