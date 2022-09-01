import 'package:flutter/cupertino.dart';
import 'package:single_house/styles/app_colors.dart';

extension AppTextStyles on TextStyle {
  static TextStyle get title => const TextStyle(
    fontSize: 44,
  );

  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get primary => copyWith(color: AppColors.primary);
}