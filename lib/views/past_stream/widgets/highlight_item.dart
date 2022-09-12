import 'package:flutter/cupertino.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class HighlightItem extends StatelessWidget {
  const HighlightItem({
    Key? key,
    required this.highlightModel,
  }) : super(key: key);

  final HighlightModel highlightModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 11),
      decoration: BoxDecoration(
        color: highlightModel.isAfk ? AppColors.darkGrey : AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            highlightModel.isAfk ? 'AFK' : 'Крутий момент',
            style: AppTextStyles.medium.white,
          ),
          const Spacer(),
          Text(
            highlightModel.time,
            style: AppTextStyles.secondary.grey,
          )
        ],
      ),
    );
  }
}
