import 'package:flutter/material.dart';
import 'package:single_house/app/router/index.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/utils/translate.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo'.t,
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      navigatorKey: RouterCore.navigatorKey,
      onGenerateRoute: RouterList.onGenerateRoute,
      initialRoute: RouterList.defaultRoute,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
        );
      },
    );
  }
}
