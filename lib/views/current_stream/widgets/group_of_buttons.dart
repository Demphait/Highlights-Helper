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
    required this.startDateTime,
    required this.highlightCallback,
    required this.afkCallBack,
    required this.addStreamCallBack,
    this.isAfk = false,
  }) : super(key: key);
  final List<HighlightModel> highlightList;
  final void Function() callback;
  final DateTime startDateTime;
  final void Function() highlightCallback;
  final void Function() afkCallBack;
  final void Function() addStreamCallBack;

  bool isAfk;

  @override
  State<GroupOfButtons> createState() => _GroupOfButtonsState();
}

class _GroupOfButtonsState extends State<GroupOfButtons> {
  bool isAfk = false;
  Duration startDateTime = DateTime.now().difference(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                widget.highlightCallback();
              },
              child: const Text('Крутий момент'),
              style: AppButtonStyles.secondaryButton(AppColors.purple),
            ),
            SizedBox(width: AppSpace.smd),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.isAfk = !widget.isAfk;
                  widget.callback();
                });

                widget.afkCallBack();
              },
              child: widget.isAfk
                  ? const Text('Повернутися')
                  : const Text('Відійти'),
              style: AppButtonStyles.secondaryButton(
                widget.isAfk ? AppColors.green : AppColors.purple,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpace.md),
        ElevatedButton(
          onPressed: () {
            showMaterialDialog(
                context: context,
                title: 'Ви дійсно хочете закінчити стрім?',
                callbackYes: () {
                  widget.addStreamCallBack();
                  RouterCore.push(MainView.name);
                });
          },
          child: const Text('Закінчити стрім'),
          style: AppButtonStyles.primaryRedButton,
        ),
      ],
    );
  }
}
