import 'package:flutter/material.dart';
import '../../../../../../core/res/colors.dart';
import '../../../../../../core/res/text_styles.dart';

class IncallDialpadView extends StatefulWidget {
  const IncallDialpadView({super.key});

  @override
  State<IncallDialpadView> createState() => _IncallDialpadViewState();
}

class _IncallDialpadViewState extends State<IncallDialpadView> {
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
    return Column(
        children: [

          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 72, right: 72, bottom: 24),
            children: List.generate(12, (index) {

                return InkWell(
                  onTap: () {
                    //widget.onTap;
                    // context
                    //     .read<DialpadCubit>()
                    //     .input(state.phoneNumber + listCall[index]);
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
            ),
          )
        ]
    );
  }
}
