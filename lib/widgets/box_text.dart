import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.pink),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
