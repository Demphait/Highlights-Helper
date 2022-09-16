import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/views/main/main_view.dart';
import 'package:single_house/widgets/dialog.dart';

class GroupOfButtons extends StatefulWidget {
  GroupOfButtons({
    Key? key,
    required this.highlightList,
    required this.callback,
    required this.highlightCallback,
    required this.afkCallBack,
    required this.addStreamCallBack,
    this.isAfk = false,
  }) : super(key: key);
  final List<HighlightModel> highlightList;
  final void Function() callback;
  final void Function() highlightCallback;
  final void Function() afkCallBack;
  final void Function() addStreamCallBack;
  bool isAfk;

  @override
  State<GroupOfButtons> createState() => _GroupOfButtonsState();
}

class _GroupOfButtonsState extends State<GroupOfButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.symmetric(horizontal: AppSpace.sm),
      padding: EdgeInsets.symmetric(horizontal: AppSpace.sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.highlightCallback();
                },
                child: const Text('Highlight moment'),
                style:
                    AppButtonStyles.secondaryButton(AppColors.purple, context),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.033),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.isAfk = !widget.isAfk;
                    widget.callback();
                  });

                  widget.afkCallBack();
                },
                child:
                    widget.isAfk ? const Text('Come Back') : const Text('AFK'),
                style: AppButtonStyles.secondaryButton(
                    widget.isAfk ? AppColors.green : AppColors.purple, context),
              ),
            ],
          ),
          SizedBox(height: AppSpace.md),
          ElevatedButton(
            onPressed: () {
              showMaterialDialog(
                  confirmText: 'End',
                  context: context,
                  title: 'End the stream?',
                  contentText: 'Do you really want to end the stream?',
                  callbackYes: () {
                    widget.addStreamCallBack();
                    RouterCore.push(MainView.name);
                  });
            },
            child: const Text('End stream'),
            style: AppButtonStyles.primaryRedButton(context),
          ),
        ],
      ),
    );
  }
}
