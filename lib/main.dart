import 'package:flutter/material.dart';
import 'package:single_house/app/app.dart';
import 'package:single_house/db/db_core.dart';

import 'utils/sp_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBCore.init();
  await SpCore.init();
  runApp(const App());
}
