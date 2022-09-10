import 'package:flutter/material.dart';
import 'package:single_house/app/app.dart';
import 'package:single_house/db/db_core.dart';

Future<void> main() async {
  await DBCore.init();
  runApp(const App());
}
