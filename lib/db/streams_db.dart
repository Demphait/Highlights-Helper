import 'package:hive_flutter/hive_flutter.dart';
import 'package:single_house/models/stream_model.dart';

class StreamsDB {
  static Box<StreamModel> get _endedStreams => Hive.box<StreamModel>('streams');
  static Box<StreamModel> get _liveStreams =>
      Hive.box<StreamModel>('liveStream');

  static StreamModel? getLivedStreams() {
    if (_liveStreams.isNotEmpty) {
      final liveStream = _liveStreams.getAt(0);
      return liveStream;
    }
    const StreamModel? liveStream = null;
    return liveStream;
  }

  static StreamModel? addLiveStream(StreamModel stream) {
    _liveStreams.add(stream);
    final liveStream = _liveStreams.getAt(0);
    return liveStream;
  }

  static void deleteLiveStream() {
    _liveStreams.deleteAll(_liveStreams.keys);
  }

  static List<StreamModel> getStreams() {
    return _endedStreams.values.toList();
  }

  static List<StreamModel> setStreams(List<StreamModel> streams) {
    _endedStreams
      ..clear()
      ..addAll(streams);
    return _endedStreams.values.toList();
  }

  static List<StreamModel> addStream(StreamModel stream) {
    _endedStreams.add(stream);
    return _endedStreams.values.toList();
  }

  static void deleteStream(int index) {
    _endedStreams.deleteAt(index);
  }

  static void deleteHighlight(StreamModel stream, int indexOfList) {
    stream.highlights.removeAt(indexOfList);
    _endedStreams.put(stream.key, stream);
  }
}
