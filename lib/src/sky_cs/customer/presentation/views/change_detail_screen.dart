import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:flutter/material.dart';

class ChangeDetailScreen extends StatefulWidget {
  const ChangeDetailScreen({super.key});

  static const routeName = '/change-detail';

  @override
  State<ChangeDetailScreen> createState() => _ChangeDetailScreenState();
}

class _ChangeDetailScreenState extends State<ChangeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textWhiteColor,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: _textTitle(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _title(context),
          _listView(context),
        ],
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.infoChange,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: AppColors.greyLightColor,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4 - 8,
            child: Text(
              'Tên trường',
              style: AppTextStyles.textStyleInterW400S12Black,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              'Giá trị trước khi cập nhật',
              style: AppTextStyles.textStyleInterW400S12Black,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3 - 8,
            child: Text(
              'Giá trị',
              style: AppTextStyles.textStyleInterW400S12Black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listView(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index){
          return Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4 - 8,
                  child: Text(
                    'Loại khách hàng',
                    style: AppTextStyles.textStyleInterW400S14Black,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    'Khách thường',
                    style: AppTextStyles.textStyleInterW400S14Black,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3 - 8,
                  child: Text(
                    'Khách VIP',
                    style: AppTextStyles.textStyleInterW400S12Black,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(color: AppColors.divideColor, height: 1),
        itemCount: 30,
      ),
    );
  }
}
