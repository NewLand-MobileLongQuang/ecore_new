import 'package:ecore/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/res/colors.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/res/text_styles.dart';
import '../../domain/entities/call_log.dart';

class CallHistoryList extends StatelessWidget {
  const CallHistoryList({super.key, required this.dataList});

  final List<CallLog> dataList;

  get titleStyle =>
      AppTextStyles.textStyleInterW400S16Black.copyWith(fontSize: 20);
  get timeStyle =>
      AppTextStyles.textStyleInterW400S16Black.copyWith(fontSize: 15);
  get descStyle =>
      AppTextStyles.textStyleInterW400S16Black.copyWith(fontSize: 15);

  String getStatusIcon(CallLog item) {
    if (item.Type == 'incoming') {
      return item.Status != 'Complete'
          ? AppMediaRes.icon_call_missed
          : AppMediaRes.icon_call_in;
    } else {
      return item.Status != 'Complete'
          ? AppMediaRes.icon_call_noanswer
          : AppMediaRes.icon_call_out;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              final item = dataList[index];

              return InkWell(
                  onTap: () {
                    if (item.RemoteNumber != null) {
                      context.callProvider.helper?.call(item.RemoteNumber!);
                    }
                  },
                  child: buildItem(index));
            },
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: AppColors.divideColor,
            ),
            itemCount: dataList.length,
          )),
        ],
      ),
    );
  }

  Widget buildItem(int index) {
    final item = dataList[index];
    bool showDate = true;
    if (showDate && index > 0 && item.Date == dataList[index - 1].Date) {
      showDate = false;
    }
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(20),
            child:
                SvgPicture.asset(width: 20, height: 20, getStatusIcon(item))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showDate
                ? Text(
                    item.Date ?? '',
                    style: timeStyle,
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
            const SizedBox(height: 8),
            Text(
              item.Description ?? item.RemoteNumber ?? '',
              style: titleStyle,
            ),
            Text(
              item.AgentDesc ?? item.Description ?? '',
              style: descStyle,
            ),
            const SizedBox(height: 8),
          ],
        ),
        Expanded(child: Container()),
        Text(
          item.Time ?? '',
          style: timeStyle,
        ),
      ],
    );
  }
}
