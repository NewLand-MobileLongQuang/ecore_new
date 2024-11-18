import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/core_utils.dart';
import 'package:ecore/src/account/presentation/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectNetworkScreen extends StatefulWidget {
  const SelectNetworkScreen({super.key});

  static const routeName = '/select-network';

  @override
  State<SelectNetworkScreen> createState() => _SelectNetworkScreenState();
}

class _SelectNetworkScreenState extends State<SelectNetworkScreen> {
  @override
  void initState() {
    context.read<AuthCubit>().getNetworks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthError) {
          CoreUtils.showSnackBar(context, state.message);
        } else if (state is AuthNetworkListLoaded) {
          if (state.networks.isEmpty) {
            CoreUtils.showSnackBar(context, 'No networks');
          }
        } else if (state is AuthNetworkSelected) {
          Navigator.pushReplacementNamed(context, '/');
        }
      }, builder: (context, state) {
        if (state is AuthNetworkListLoaded) {
          final orgs = state.networks;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select network',
                      style: AppTextStyles.textStyleInterW500S32Black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.read<AuthCubit>().selectNetwork(network: orgs[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.primaryOpa11,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.primaryColor),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Text(
                                        (index+1).toString(),
                                        style: AppTextStyles.textStyleInterW500S14White,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      '${orgs[index].Name ?? ''} - ${orgs[index].Id}' ,
                                      style: AppTextStyles.textStyleInterW500S16Black,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 16),
                        itemCount: orgs.length,
                      ),
                    ),
                  ]
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
