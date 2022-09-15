import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/widgets/app_text_field.dart';
import 'package:single_house/styles/app_text_styles.dart';

void showMaterialDialog({
  required BuildContext context,
  required String title,
  required String confirmText,
  String contentText = '',
  required void Function() callbackYes,
  void Function()? callbackNo,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: contentText.isNotEmpty
            ? Text(
                contentText,
                style: AppTextStyles.mediumThin.grey,
              )
            : null,
        titleTextStyle: AppTextStyles.mediumThin.white,
        backgroundColor: AppColors.mediumGrey,
        title: Text(title),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                if (callbackNo != null) {
                  callbackNo();
                }
                RouterCore.pop();
              },
              child: Text('Cancel', style: AppTextStyles.mediumThin.white)),
          TextButton(
            onPressed: () {
              callbackYes();
            },
            child: Text(confirmText, style: AppTextStyles.mediumThin.white),
          )
        ],
      );
    },
  );
}

void showTextField({
  required BuildContext context,
  required String title,
  required TextEditingController controller,
  required void Function() callbackYes,
  void Function()? callbackNo,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titleTextStyle: AppTextStyles.mediumThin.white,
        backgroundColor: AppColors.mediumGrey,
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(controller: controller),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (callbackNo != null) {
                callbackNo();
              }
              RouterCore.pop();
            },
            child: Text('Back', style: AppTextStyles.mediumThin.white),
          ),
          TextButton(
            onPressed: () {
              callbackYes();
            },
            child: Text('Continue', style: AppTextStyles.mediumThin.white),
          )
        ],
      );
    },
  );
}
