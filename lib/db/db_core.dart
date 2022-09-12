import 'package:hive_flutter/hive_flutter.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/models/stream_model.dart';

abstract class DBCore {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(StreamModelAdapter());
    Hive.registerAdapter(HighlightModelAdapter());
    await Hive.openBox<StreamModel>('streams');
  }
}
