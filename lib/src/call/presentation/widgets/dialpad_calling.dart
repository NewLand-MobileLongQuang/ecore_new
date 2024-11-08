import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/res/colors.dart';
import '../../../../../../core/res/media_res.dart';
import '../../../../../../core/res/text_styles.dart';

import '../cubit/dialpad_cubit.dart';


class DialpadCallingView extends StatefulWidget {
  const DialpadCallingView({super.key});

  @override
  State<DialpadCallingView> createState() => _DialpadCallingViewState();
}

class _DialpadCallingViewState extends State<DialpadCallingView>

{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialpadCubit, DialpadState>(
      builder: (context, state) {
        state as DialpadCalling;
        var newList;
        return Column(
          children: [
            const SizedBox(height: 16),
            Text(
              state.hotline,
              style: AppTextStyles.textStyleInterW400S28Black,
            ),
            //SizedBox(height: 8),
            Text(
              'đang gọi...',
              style: AppTextStyles.textStyleInterW400S16Grey,
            ),
            const SizedBox(height: 16),
            if(newList.isNotEmpty)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    newList.first.name,
                    style: AppTextStyles.textStyleInterW500S32Black,
                  ),
                  Text(
                    state.phoneNumber,
                    style: AppTextStyles.textStyleInterW500S16Black,
                  ),
                ]
              ),
            if(newList.isEmpty)
              Column(
                children: [
                  Text(
                    state.phoneNumber,
                    style: AppTextStyles.textStyleInterW500S32Black,
                  ),
                  Text(
                    'Thêm khách hàng',
                    style: AppTextStyles.textStyleInterW500S16Primary,
                  ),
                ],
              ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                          padding: const EdgeInsets.all(27),
                          decoration: BoxDecoration(
                            color: AppColors.primaryOpa11,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppMediaRes.iconMic)
                      ),
                    ),
                    Text(
                      'tắt mic',
                      style: AppTextStyles.textStyleInterW500S14Black,
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                          padding: const EdgeInsets.all(27),
                          decoration: const BoxDecoration(
                            color: AppColors.greyLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            AppMediaRes.iconPause01,
                          )
                      ),
                    ),
                    Text(
                      'giữ cuộc gọi',
                      style: AppTextStyles.textStyleInterW500S14Black,
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                          padding: const EdgeInsets.all(27),
                          decoration: BoxDecoration(
                            color: AppColors.primaryOpa11,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppMediaRes.iconKeyboard)
                      ),
                    ),
                    Text(
                      'bàn phím',
                      style: AppTextStyles.textStyleInterW500S14Black,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                          padding: const EdgeInsets.all(27),
                          decoration: const BoxDecoration(
                            color: AppColors.greyLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppMediaRes.iconCall4)
                      ),
                    ),
                    Text(
                      'chuyển',
                      style: AppTextStyles.textStyleInterW500S14Black,
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                          padding: const EdgeInsets.all(27),
                          decoration: const BoxDecoration(
                            color: AppColors.greyLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            AppMediaRes.iconPersonGroup02,
                          )
                      ),
                    ),
                    Text(
                      'nhóm',
                      style: AppTextStyles.textStyleInterW500S14Black,
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                          padding: const EdgeInsets.all(27),
                          decoration: const BoxDecoration(
                            color: AppColors.greyLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppMediaRes.iconTicket02)
                      ),
                    ),
                    Text(
                      'eTicket',
                      style: AppTextStyles.textStyleInterW500S14Black,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 48),
            InkWell(
              onTap: () {

              },
              child: Container(
                  padding: const EdgeInsets.all(27),
                  decoration: const BoxDecoration(
                    color: AppColors.buttonRedColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppMediaRes.iconCall3,
                  )
              ),
            ),
          ],
        );
      },
    );
  }
}

