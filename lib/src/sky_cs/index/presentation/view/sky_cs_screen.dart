import 'package:ecore/core/common/widgets/inputs/i_dialog.dart';
import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/common/widgets/main_app_bar.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/apps.dart';
import 'package:ecore/src/sky_cs/common/sky_cs_context_extensions.dart';
import 'package:ecore/src/sky_cs/common/utils.dart';
import 'package:ecore/src/sky_cs/customer/presentation/views/customer_skycs_manage_screen.dart';
import 'package:ecore/src/sky_cs/index/presentation/cubit/sky_cs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkyCsScreen extends StatefulWidget {
  const SkyCsScreen({super.key});

  static const routeName = 'index';

  @override
  State<SkyCsScreen> createState() => _SkyCsScreenState();
}

class _SkyCsScreenState extends State<SkyCsScreen> {
  @override
  void initState() {
    context.read<SkyCsCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(SkyCsScreen.routeName);

    return BlocConsumer<SkyCsCubit, SkyCsState>(
      listener: (context, state) {
        if(state is SkyCsError) {
          IDialog.showNotificationDialog(context, state.message);
        }
      },
      builder: (context, state) {
        if(state is SkyCsLoading) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.textWhiteColor,
            child: const LoadingView(),
          );
        }
        if(state is SkyCsLoaded) {
          return Scaffold(
            appBar: MainAppBar(title: l('SkyCS'), isHeader: true,),
            body: Padding(
              padding: const EdgeInsets.all(32),
              child: GridView.builder(
                itemCount: AppSkyCs.listSolutionSkyCs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        if (index == 4) {
                          context.pushNamed(SkyCsUtils.getFullRouteName(CustomerSkyCSManageScreen.routeName));
                        }
                      },
                      child: Card(
                        color: AppColors.textWhiteColor,
                        shadowColor: AppColors.buttonGreyColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.divideColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        surfaceTintColor: AppColors.textWhiteColor,
                        elevation: 4,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AppSkyCs.listSolutionSkyCs[index].image),
                              const SizedBox(height: 16),
                              Text(
                                l(AppSkyCs.listSolutionSkyCs[index].title),
                                style: AppTextStyles.textStyleInterW400S16Black,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      )
                  );
                },
              ),
            )
          );
        }
        return Container();
      },
    );
  }
}