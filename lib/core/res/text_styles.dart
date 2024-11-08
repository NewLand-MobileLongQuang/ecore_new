
import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

class AppTextStyles {
  //font family
  static const TextStyle textStyleInter = TextStyle(fontFamily: AppFonts.interFont);

  //font weight
  static TextStyle textStyleInterW400 = textStyleInter.copyWith(fontWeight: FontWeight.w400);
  static TextStyle textStyleInterW500 = textStyleInter.copyWith(fontWeight: FontWeight.w500);
  static TextStyle textStyleInterW600 = textStyleInter.copyWith(fontWeight: FontWeight.w600);

  //font size
  static TextStyle textStyleInterW400S11 = textStyleInterW400.copyWith(fontSize: 11);
  static TextStyle textStyleInterW400S12 = textStyleInterW400.copyWith(fontSize: 12);
  static TextStyle textStyleInterW400S14 = textStyleInterW400.copyWith(fontSize: 14);
  static TextStyle textStyleInterW400S16 = textStyleInterW400.copyWith(fontSize: 16);
  static TextStyle textStyleInterW400S24 = textStyleInterW400.copyWith(fontSize: 24);
  static TextStyle textStyleInterW400S28 = textStyleInterW400.copyWith(fontSize: 28);
  static TextStyle textStyleInterW400S30 = textStyleInterW400.copyWith(fontSize: 30);

  static TextStyle textStyleInterW500S12 = textStyleInterW500.copyWith(fontSize: 12);
  static TextStyle textStyleInterW500S14 = textStyleInterW500.copyWith(fontSize: 14);
  static TextStyle textStyleInterW500S16 = textStyleInterW500.copyWith(fontSize: 16);
  static TextStyle textStyleInterW500S18 = textStyleInterW500.copyWith(fontSize: 18);
  static TextStyle textStyleInterW500S32 = textStyleInterW400.copyWith(fontSize: 32);

  static TextStyle textStyleInterW600S16 = textStyleInterW600.copyWith(fontSize: 16);

  //color
  static TextStyle textStyleInterW400S11White= textStyleInterW400S11.copyWith(color: AppColors.textWhiteColor);

  static TextStyle textStyleInterW400S12Primary = textStyleInterW400S12.copyWith(color: AppColors.primaryColor);
  static TextStyle textStyleInterW400S12Grey = textStyleInterW400S12.copyWith(color: AppColors.textGreyColor);
  static TextStyle textStyleInterW400S12Black = textStyleInterW400S12.copyWith(color: AppColors.textBlackColor);

  static TextStyle textStyleInterW400S14Grey = textStyleInterW400S14.copyWith(color: AppColors.textGreyColor);
  static TextStyle textStyleInterW400S14Red = textStyleInterW400S14.copyWith(color: AppColors.buttonRedColor);
  static TextStyle textStyleInterW400S14Black = textStyleInterW400S14.copyWith(color: AppColors.textBlackColor);
  static TextStyle textStyleInterW400S14Primary = textStyleInterW400S14.copyWith(color: AppColors.primaryColor);

  static TextStyle textStyleInterW400S16Black = textStyleInterW400S16.copyWith(color: AppColors.textBlackColor);
  static TextStyle textStyleInterW400S16Grey = textStyleInterW400S16.copyWith(color: AppColors.textGreyColor);
  static TextStyle textStyleInterW400S16Red = textStyleInterW400S16.copyWith(color: AppColors.buttonRedColor);
  static TextStyle textStyleInterW400S16Primary = textStyleInterW400S16.copyWith(color: AppColors.primaryColor);
  static TextStyle textStyleInterW400S16Blue = textStyleInterW400S16.copyWith(color: AppColors.textBlueColor);
  static TextStyle textStyleInterW400S16White = textStyleInterW400S16.copyWith(color: AppColors.textWhiteColor);

  static TextStyle textStyleInterW400S24Black = textStyleInterW400S24.copyWith(color: AppColors.textBlackColor);

  static TextStyle textStyleInterW400S28Black = textStyleInterW400S28.copyWith(color: AppColors.textBlackColor);

  static TextStyle textStyleInterW400S30Black = textStyleInterW400S30.copyWith(color: AppColors.textBlackColor);

  static TextStyle textStyleInterW500S12Blue = textStyleInterW500S12.copyWith(color: AppColors.textBlueColor);
  static TextStyle textStyleInterW500S12Black = textStyleInterW500S12.copyWith(color: AppColors.textBlackColor);
  static TextStyle textStyleInterW500S12Green = textStyleInterW500S12.copyWith(color: AppColors.textGreenColor);

  static TextStyle textStyleInterW500S14Black = textStyleInterW500S14.copyWith(color: AppColors.textBlackColor);
  static TextStyle textStyleInterW500S14Grey = textStyleInterW500S14.copyWith(color: AppColors.textGreyColor);
  static TextStyle textStyleInterW500S14Primary = textStyleInterW500S14.copyWith(color: AppColors.primaryColor);
  static TextStyle textStyleInterW500S14White = textStyleInterW500S14.copyWith(color: AppColors.textWhiteColor);
  static TextStyle textStyleInterW500S14Blue = textStyleInterW500S14.copyWith(color: AppColors.textBlueColor);
  static TextStyle textStyleInterW500S14Yellow = textStyleInterW500S14.copyWith(color: AppColors.textYellowColor);

  static TextStyle textStyleInterW500S16Black = textStyleInterW500S16.copyWith(color: AppColors.textBlackColor);
  static TextStyle textStyleInterW500S16Primary = textStyleInterW500S16.copyWith(color: AppColors.primaryColor);
  static TextStyle textStyleInterW500S16White = textStyleInterW500S16.copyWith(color: AppColors.textWhiteColor);

  static TextStyle textStyleInterW500S18Black = textStyleInterW500S18.copyWith(color: AppColors.textBlackColor);
  static TextStyle textStyleInterW500S18White = textStyleInterW500S18.copyWith(color: AppColors.textWhiteColor);

  static TextStyle textStyleInterW500S32Black = textStyleInterW500S32.copyWith(color: AppColors.textBlackColor);
  static TextStyle textStyleInterW500S32Red = textStyleInterW500S32.copyWith(color: AppColors.textRedColor);

  static TextStyle textStyleInterW600S16Primary = textStyleInterW600S16.copyWith(color: AppColors.primaryColor);
  static TextStyle textStyleInterW600S16Black = textStyleInterW600S16.copyWith(color: AppColors.textBlackColor);
}