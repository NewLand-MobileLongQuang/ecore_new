import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/services/injection/injection_container.dart';
import 'package:ecore/src/sky_cs/customer/presentation/cubit/change_view_cubit/change_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeView extends StatefulWidget {
  const ChangeView({required this.customerCodeSys, super.key});

  final String customerCodeSys;

  @override
  State<ChangeView> createState() => _ChangeViewState();
}

class _ChangeViewState extends State<ChangeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ChangeViewCubit(searchCustomerHistUseCase: sl())
        ..init(widget.customerCodeSys),
      child: BlocConsumer<ChangeViewCubit, ChangeViewState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is ChangeViewLoading){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.textWhiteColor,
              child: const LoadingView(),
            );
          }
          if(state is ChangeViewLoaded) {
            return ListView.builder(
              itemCount: state.listCustomerHist.length,
              itemBuilder: (context, index) {
                final change = state.listCustomerHist[index];
                return InkWell(
                  onTap: () {
                    // Add your onTap functionality here if needed
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.textWhiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  change.LUDTimeUTC,
                                  style: AppTextStyles.textStyleInterW400S16Black,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Text(
                                'Chi tiết',
                                style: AppTextStyles.textStyleInterW400S12Primary,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed('/change-detail', arguments: change);
                              },
                            ),
                          ],
                        ),
                        Text(
                          change.LUByName,
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
