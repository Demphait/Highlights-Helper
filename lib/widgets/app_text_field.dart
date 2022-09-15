import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.mediumThin.white,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: AppTextStyles.mediumThin.grey,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppSpace.sm, vertical: AppSpace.smd),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          gapPadding: 0,
        ),
        hintText: 'Stream name',
      ),
    );
  }
}
