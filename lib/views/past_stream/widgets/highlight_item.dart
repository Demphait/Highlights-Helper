import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/widgets/dialog.dart';

class HighlightItem extends StatelessWidget {
  const HighlightItem({
    Key? key,
    required this.highlightModel,
    required this.deleteHighlight,
  }) : super(key: key);

  final HighlightModel highlightModel;
  final void Function() deleteHighlight;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => showMaterialDialog(
                context: context,
                title:
                    'Do you want to remove the highlight ${highlightModel.time}?',
                callbackYes: () {
                  deleteHighlight();
                  RouterCore.pop();
                }),
            backgroundColor: AppColors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => showMaterialDialog(
                context: context,
                title:
                    'Do you want to remove the highlight - ${highlightModel.time}?',
                callbackYes: () {
                  deleteHighlight();
                  RouterCore.pop();
                }),
            backgroundColor: AppColors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpace.sm),
        child: Container(
          height: 42,
          padding: EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 11),
          decoration: BoxDecoration(
            color:
                highlightModel.isAfk ? AppColors.darkGrey : AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Text(
                highlightModel.isAfk ? 'AFK' : 'Highlight moment',
                style: AppTextStyles.medium.white,
              ),
              const Spacer(),
              Text(
                highlightModel.time,
                style: AppTextStyles.secondary.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
