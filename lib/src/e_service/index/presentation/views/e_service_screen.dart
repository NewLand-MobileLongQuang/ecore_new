import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/common/widgets/main_app_bar.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/apps.dart';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/guarantee_manage/presentation/views/guarantee_manage_screen.dart';
import 'package:ecore/src/e_service/index/presentation/cubit/e_service_cubit/e_service_cubit.dart';
import 'package:ecore/src/e_service/repair_history_search/presentation/views/repair_history_search_screen.dart';
import 'package:ecore/src/e_service/repair_manage/presentation/views/repair_manage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EServiceScreen extends StatefulWidget {
  const EServiceScreen({super.key});

  static const routeName = 'index';

  @override
  State<EServiceScreen> createState() => _EServiceScreenState();
}

class _EServiceScreenState extends State<EServiceScreen> {
  @override
  void initState() {
    context.read<EServiceCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localizer(EServiceScreen.routeName);

    return BlocConsumer<EServiceCubit, EServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is EServiceLoading) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.textWhiteColor,
            child: const LoadingView(),
          );
        }
        if (state is EServiceLoaded) {
          return Scaffold(
              appBar: MainAppBar(
                title: l('E-Service'),
                isHeader: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(32),
                child: GridView.builder(
                  itemCount: AppEService.listSolutionEService.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          context.pushNamed(EServiceUtils.getFullRouteName(GuaranteeManageScreen.routeName));
                        }
                        if (index == 1) {
                          context.pushNamed(EServiceUtils.getFullRouteName(RepairManageScreen.routeName));
                        }
                        if (index == 2) {

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
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(AppEService.listSolutionEService[index].image),
                                const SizedBox(height: 16),
                                Text(
                                  l(AppEService.listSolutionEService[index].title),
                                  style: AppTextStyles.textStyleInterW400S16Black,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
        }
        return Container();
      },
    );
  }
}
