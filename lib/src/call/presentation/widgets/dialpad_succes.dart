import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/res/colors.dart';
import '../../../../../../core/res/media_res.dart';
import '../../../../../../core/res/text_styles.dart';
import '../cubit/dialpad_cubit.dart';


class DialpadCallSuccessView extends StatefulWidget {
  const DialpadCallSuccessView({super.key});

  @override
  State<DialpadCallSuccessView> createState() => _DialpadCallSuccessViewState();
}

class _DialpadCallSuccessViewState extends State<DialpadCallSuccessView> {
  var isKeyboard = false;

  final List<String> listCall = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#'
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialpadCubit, DialpadState>(
      builder: (context, state) {
        state as DialpadCallSuccess;
        var newList;
        return Column(
          children: [
            const SizedBox(height: 16),
            Text(
              state.hotline,
              style: AppTextStyles.textStyleInterW400S28Black,
            ),
            //SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryOpa11,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '00:10',
                style: AppTextStyles.textStyleInterW500S16Primary,
              ),
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
                ],
              ),
            if(isKeyboard == false) ...[
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
                            decoration: BoxDecoration(
                              color: AppColors.primaryOpa11,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              AppMediaRes.iconPause02,
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
                          setState(() {
                            isKeyboard = true;
                          });
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
                          Navigator.pushNamed(context, '/forward');
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
            if(isKeyboard == true) ...[
              const SizedBox(height: 32),
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 72, right: 72, bottom: 24),
                children: List.generate(15, (index) {
                  if (index < 12) {
                    return InkWell(
                      onTap: () {
                        //widget.onTap;
                        context
                            .read<DialpadCubit>()
                            .input(state.phoneNumber + listCall[index]);
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: AppColors.primaryOpa11,
                        ),
                        child: Center(
                          child: Text(listCall[index],
                              style: AppTextStyles.textStyleInterW500S32Black),
                        ),
                      ),
                    );
                  }
                  else if (index == 12) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          isKeyboard = false;
                        });
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Center(
                          child: Text(
                            'Ẩn',
                            style: AppTextStyles.textStyleInterW500S14Grey,
                          ),
                        ),
                      ),
                    );
                  } else if (index == 13) {
                    return InkWell(
                      onTap: () {

                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: AppColors.buttonRedColor,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppMediaRes.iconCall3,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return state.phoneNumber != ''
                        ? InkWell(
                      onTap: () {

                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppMediaRes.iconBackspace,
                          ),
                        ),
                      ),
                    )
                        : Container();
                  }
                }),
              )
            ],
          ],
        );
      },
    );
  }
}

