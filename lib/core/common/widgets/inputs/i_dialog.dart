import 'package:flutter/material.dart';
import 'package:ecore/core/res/colors.dart';

import '../../../res/strings.dart';
import '../../../res/text_styles.dart';

class IDialog {
  static Future<bool?> showConfirmDeleteDialog(BuildContext context, String content) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          content: Text(
            content,
            style: AppTextStyles.textStyleInterW500S18Black,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                AppStrings.cancel,
                style: AppTextStyles.textStyleInterW400S16Grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                AppStrings.delete,
                style: AppTextStyles.textStyleInterW400S16Red,
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<bool?> showConfirmFinishDialog(BuildContext context, String content) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          content: Text(
            content,
            style: AppTextStyles.textStyleInterW500S18Black,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                AppStrings.cancel,
                style: AppTextStyles.textStyleInterW400S16Grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                AppStrings.finish,
                style: AppTextStyles.textStyleInterW400S16Primary,
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showNotificationDialog(BuildContext context, String content) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          title: Text(
            AppStrings.error,
            style: AppTextStyles.textStyleInterW500S32Red,
          ),
          content: Text(
            content,
            style: AppTextStyles.textStyleInterW500S16Black,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                AppStrings.cancel,
                style: AppTextStyles.textStyleInterW400S16Primary,
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<DateTime?> showCalendarDialog(BuildContext context) async {
    var dateTime = DateTime.now();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2200),
              onDateChanged: (DateTime date) {
                dateTime = date;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                AppStrings.cancel,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(dateTime);
              },
              child: const Text(
                AppStrings.confirm,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showListDialog(BuildContext context, List<String> contents) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.height * 0.75,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Danh sách bao',
                    style: AppTextStyles.textStyleInterW500S18Black,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index+1}",
                                style: AppTextStyles.textStyleInterW400S16Black,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                contents[index],
                                style: AppTextStyles.textStyleInterW400S16Black,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: contents.length,
                    )
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Đóng",
                        style: AppTextStyles.textStyleInterW500S14White,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

