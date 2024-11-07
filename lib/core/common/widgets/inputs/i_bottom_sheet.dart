import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/text_styles.dart';

class IBottomSheet extends StatefulWidget{
  static void showBottomSheetChooseFilter(BuildContext context, List<String> listFilter, Function(bool?)? onSelected) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  color: AppColors.textWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: Column(
                  children: listFilter.map((e) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            e,
                            style: AppTextStyles.textStyleInterW400S16Black,
                          ),
                        ),
                        // Checkbox(
                        //   checkColor: Colors.white,
                        //   value:
                        //   shape: const CircleBorder(),
                        //   onChanged: onSelected,
                        // ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  color: AppColors.textWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: Column(
                  children: [
                    // _itemFilter('Sắp xếp tăng dần', false),
                    // const Divider(height: 1, color: AppColors.divideColor,),
                    // _itemFilter('Sắp xếp giảm dần', false),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: const BoxDecoration(
                  color: AppColors.textWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Hủy',
                        style: AppTextStyles.textStyleInterW500S14Primary,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: AppTextStyles.textStyleInterW500S14Primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}