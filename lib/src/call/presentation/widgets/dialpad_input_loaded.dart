import 'package:ecore/core/extensions/context_extension.dart';
import 'package:ecore/src/call/presentation/views/call_history_screen.dart';
import 'package:ecore/src/call/presentation/views/forward_screen.dart';
import 'package:ecore/src/call/presentation/widgets/call_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/res/colors.dart';
import '../../../../../../core/res/media_res.dart';
import '../../../../../../core/res/text_styles.dart';
import '../../../../fake_data/person_contact.dart';
import '../cubit/dialpad_cubit.dart';

class DialpadInputLoadedView extends StatefulWidget {
  const DialpadInputLoadedView({
    super.key,
  });

  @override
  State<DialpadInputLoadedView> createState() => _DialpadInputLoadedViewState();
}

class _DialpadInputLoadedViewState extends State<DialpadInputLoadedView> {
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
  String dropdownValue = PersonContact.listPhone.first;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialpadCubit, DialpadState>(
      builder: (context, state) {
        state as DialpadInputLoaded;
        return Column(
          children: [
            Expanded(child: _phoneArea(state)),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 72, right: 72, bottom: 24),
              children: List.generate(15, (index) {
                if (index < 12) {
                  // return InkWell(
                  //   onTap: () {
                  //     //widget.onTap;
                  //     context
                  //         .read<DialpadCubit>()
                  //         .input(state.phoneNumber + listCall[index]);
                  //   },
                  //   highlightColor: Colors.transparent,
                  //   splashColor: Colors.transparent,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(500),
                  //       color: AppColors.primaryOpa11,
                  //     ),
                  //     child: Center(
                  //       child: Text(listCall[index],
                  //           style: AppTextStyles.textStyleInterW500S32Black),
                  //     ),
                  //   ),
                  // );

                  return CallRoundedButton(
                      label: listCall[index],
                      onPressed: () {
                        context
                            .read<DialpadCubit>()
                            .input(state.phoneNumber + listCall[index]);
                      });
                } else if (index == 12) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CallHistoryScreen.routeName);
                      //Navigator.pushNamed(context, CallForwardScreen.routeName);
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppMediaRes.iconList,
                        ),
                      ),
                    ),
                  );
                } else if (index == 13) {
                  return InkWell(
                    onTap: () {
                      // context
                      //     .read<DialpadCubit>()
                      //     .call(dropdownValue, state.phoneNumber);

                      context.callProvider.helper?.call(state.phoneNumber);
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppMediaRes.iconCall2,
                        ),
                      ),
                    ),
                  );
                } else {
                  return state.phoneNumber != ''
                      ? InkWell(
                          onTap: () {
                            context.read<DialpadCubit>().input(state.phoneNumber
                                .substring(0, state.phoneNumber.length - 1));
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
        );
      },
    );
  }

  Widget _phoneArea(DialpadInputLoaded state) {
    final newList = PersonContact.listContact
        .where((element) => element.phone.contains(state.phoneNumber))
        .toList();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.only(right: 32),
          decoration: BoxDecoration(
            color: AppColors.primaryOpa11,
            borderRadius: BorderRadius.circular(500),
          ),
          child: DropdownButton<String>(
            value: context.sessionInfo!.callingInfo != null
                ? context.sessionInfo!.callingInfo!.CalloutNumbers!.first
                : '',
            menuMaxHeight: 150,
            icon: const FaIcon(
              FontAwesomeIcons.caretDown,
              color: AppColors.textBlackColor,
              size: 16,
            ),
            style: AppTextStyles.textStyleInterW500S16Black,
            underline: Container(
              height: 1,
              color: Colors.transparent,
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: context.sessionInfo!.callingInfo != null
                ? context.sessionInfo!.callingInfo!.CalloutNumbers!
                    .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          value,
                          style: AppTextStyles.textStyleInterW500S16Black,
                        ),
                      ),
                    );
                  }).toList()
                : [],
          ),
        ),
        Text(
          state.phoneNumber,
          style: AppTextStyles.textStyleInterW400S30Black,
        ),
        Expanded(
          child: 1 != 1 && newList.isNotEmpty && state.phoneNumber != ''
              ? ListView.separated(
                  itemCount: newList.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.transparent,
                      height: 8,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const SizedBox(width: 32),
                        Text(
                          newList[index].name,
                          style: AppTextStyles.textStyleInterW400S14Black,
                        ),
                        Expanded(child: Container()),
                        Text(
                          newList[index].phone,
                          style: AppTextStyles.textStyleInterW400S14Grey,
                        ),
                        const SizedBox(width: 32),
                      ],
                    );
                  },
                )
              : 1 != 1 && state.phoneNumber != ''
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Thêm khách hàng',
                        style: AppTextStyles.textStyleInterW500S16Primary,
                      ),
                    )
                  : Container(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
