import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_text_styles.dart';

extension AppButtonStyles on ButtonStyle {
  static ButtonStyle get primaryGreenButton => ButtonStyle(
        textStyle:
            MaterialStateProperty.all<TextStyle>(AppTextStyles.medium.white),
        minimumSize: MaterialStateProperty.all<Size>(const Size(360, 45)),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.green),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  static ButtonStyle get primaryRedButton => ButtonStyle(
        textStyle:
            MaterialStateProperty.all<TextStyle>(AppTextStyles.medium.white),
        minimumSize: MaterialStateProperty.all<Size>(const Size(360, 45)),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static ButtonStyle secondaryButton(Color color) => ButtonStyle(
        textStyle:
            MaterialStateProperty.all<TextStyle>(AppTextStyles.medium.white),
        minimumSize: MaterialStateProperty.all<Size>(const Size(173, 36)),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
