import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';

void showMaterialDialog({
  required BuildContext context,
  required String title,
  required void Function() callbackYes,
  void Function()? callbackNo,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                if (callbackNo != null) {
                  callbackNo();
                }
                RouterCore.pop();
              },
              child: const Text('No')),
          TextButton(
            onPressed: () {
              callbackYes();
            },
            child: const Text('Yes'),
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
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
            ),
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
              child: const Text('Back')),
          TextButton(
            onPressed: () {
              callbackYes();
            },
            child: const Text('Continue'),
          )
        ],
      );
    },
  );
}
