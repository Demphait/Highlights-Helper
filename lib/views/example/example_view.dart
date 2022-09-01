import 'package:flutter/material.dart';
import 'package:single_house/app/router/index.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/translate.dart';
import 'package:single_house/widgets/app_loader.dart';

class ExampleView extends StatefulWidget {
  static const String name = 'ExampleView';
  static PageRoute route() => RouterCore.createRoute(
        const ExampleView._(),
      );

  const ExampleView._();

  @override
  _ExampleViewState createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  @override
  Widget build(BuildContext context) {
    print("View: ExampleView -- build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'some_text'.t,
          style: AppTextStyles.title.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('ExampleView'.t),
          AppSpaceBox.md,
          InkWell(
            child: AppLoader(),
            onTap: () {
              RouterCore.push(ExampleView.name);
            },
          ),
        ],
      ),
    );
  }
}
