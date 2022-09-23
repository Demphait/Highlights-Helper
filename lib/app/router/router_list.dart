import 'package:flutter/material.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:single_house/views/auth/forgot_pass_view.dart';
import 'package:single_house/views/auth/login_view.dart';
import 'package:single_house/views/auth/sign_up_view.dart';
import 'package:single_house/views/current_stream/current_stream_view.dart';
import 'package:single_house/views/example/example_view.dart';
import 'package:single_house/views/main/main_view.dart';
import 'package:single_house/views/past_stream/past_stream_view.dart';

abstract class RouterList {
  // static String get defaultRoute => MainView.name;
  static String get defaultRoute => LoginView.name;

  static Route<dynamic>? onGenerateRoute(RouteSettings args) {
    if (args.name != null && _list[args.name] != null) {
      return _list[args.name]!(args.arguments);
    }
    return _list[defaultRoute]!(args.arguments);
  }

  static Map<String, PageRoute Function(Object?)?> get _list => {
        ExampleView.name: (arg) => ExampleView.route(),
        LoginView.name: (arg) => LoginView.route(),
        SignUpView.name: (arg) => SignUpView.route(),
        ForgotPassView.name: (arg) => ForgotPassView.route(),
        MainView.name: (arg) => MainView.route(),
        PastStreamView.name: (arg) {
          if (arg is StreamModel) {
            return PastStreamView.route(arg);
          }
          return ExampleView.route();
        },
        CurrentStreamView.name: (arg) {
          if (arg is StreamModel) {
            return CurrentStreamView.route(arg);
          }
          return ExampleView.route();
        }
      };
}
