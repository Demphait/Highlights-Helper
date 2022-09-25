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
  static ButtonStyle primaryRedButton(BuildContext context) => ButtonStyle(
        textStyle:
            MaterialStateProperty.all<TextStyle>(AppTextStyles.medium.white),
        minimumSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width * 0.95, 45)),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static ButtonStyle secondaryButton(Color color, BuildContext context) =>
      ButtonStyle(
        textStyle:
            MaterialStateProperty.all<TextStyle>(AppTextStyles.medium.white),
        minimumSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width * 0.44, 36)),
        maximumSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width * 0.44, 45)),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
