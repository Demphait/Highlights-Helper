import 'package:flutter/cupertino.dart';
import 'package:single_house/styles/app_colors.dart';

extension AppTextStyles on TextStyle {
  static TextStyle get regular => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        fontFamily: 'Rubik',
      );
  static TextStyle get middle => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'Rubik',
      );
  static TextStyle get middleThin => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        fontFamily: 'Rubik',
      );
  static TextStyle get medium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: 'Rubik',
      );
  static TextStyle get secondary => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        fontFamily: 'Rubik',
      );
  static TextStyle get inputText => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: 'Rubik',
      );
  static TextStyle get mediumThin => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'Rubik',
      );
  static TextStyle get large => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 32,
        fontFamily: 'Rubik',
      );
  static TextStyle get veryLarge => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 48,
        fontFamily: 'Rubik',
      );

  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get grey => copyWith(color: AppColors.grey);
  TextStyle get lightGrey => copyWith(color: AppColors.lightGrey);
  TextStyle get pink => copyWith(color: AppColors.pink);
  TextStyle get red => copyWith(color: AppColors.red);
}
