import 'package:flutter/material.dart';
import 'package:single_house/views/example/example_view.dart';

abstract class RouterList {
  static String get defaultRoute => ExampleView.name;

  static Route<dynamic>? onGenerateRoute(RouteSettings args) {
    if (args.name != null && _list[args.name] != null) {
      return _list[args.name]!(args.arguments);
    }
    return _list[defaultRoute]!(args.arguments);
  }

  static Map<String, PageRoute Function(Object?)?> get _list => {
        ExampleView.name: (arg) => ExampleView.route(),
      };
}
