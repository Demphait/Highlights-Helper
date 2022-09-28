import 'package:flutter/material.dart';
import 'package:single_house/app/app.dart';
import 'package:single_house/db/db_core.dart';
import 'package:firebase_core/firebase_core.dart';

import 'utils/sp_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DBCore.init();
  await SpCore.init();
  runApp(const App());
}
