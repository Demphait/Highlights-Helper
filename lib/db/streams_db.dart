import 'package:hive_flutter/hive_flutter.dart';
import 'package:single_house/models/stream_model.dart';

class StreamsDB {
  static Box<StreamModel> get _box => Hive.box<StreamModel>('streams');

  static List<StreamModel> getStreams() {
    return _box.values.toList();
  }

  static List<StreamModel> setStreams(List<StreamModel> streams) {
    _box
      ..clear()
      ..addAll(streams);
    return _box.values.toList();
  }

  static List<StreamModel> addStream(StreamModel stream) {
    _box.add(stream);
    return _box.values.toList();
  }

  static void deleteStream(int index) {
    _box.deleteAt(index);
  }
}
