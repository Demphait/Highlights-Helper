import 'package:bloc/bloc.dart';
import 'package:single_house/db/streams_db.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/models/stream_model.dart';

part 'stream_state.dart';

class StreamCubit extends Cubit<StreamState> {
  StreamCubit() : super(StreamState());

  Future<void> loadingStreams() async {
    final streams = StreamsDB.getStreams();

    emit(state.copyWith(streams: streams));
  }

  Future<void> addStream(
      DateTime timeStartStream, List<HighlightModel> highlights) async {
    final streams = StreamsDB.getStreams();

    final Duration durationStream = DateTime.now().difference(timeStartStream);
    final DateTime timeEndStream = timeStartStream.add(durationStream);

    final String startStream = DateFormat('HH:mm:ss').format(timeStartStream);
    final String endStream = DateFormat('HH:mm:ss').format(timeEndStream);

    StreamsDB.addStream(
      StreamModel(
        name: 'Stream ${streams.length + 1}',
        date: DateFormat('yyyy-MM-dd').format(timeStartStream),
        time: '$startStream - $endStream',
        highlights: highlights,
      ),
    );
  }

  Future<void> fetch() async {
    emit(state.copyWith(status: StreamStatus.loading));
    await Future.wait([
      loadingStreams(),
    ]);
    emit(state.copyWith(status: StreamStatus.ready));
  }
}
