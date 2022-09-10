import 'package:bloc/bloc.dart';
import 'package:single_house/db/streams_db.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:intl/intl.dart';

part 'stream_state.dart';

class StreamCubit extends Cubit<StreamState> {
  StreamCubit() : super(StreamState());

  Future<void> loadingStreams() async {
    await Future.delayed(const Duration(seconds: 5));
    List<StreamModel> streams = List.generate(
      10,
      (index) => StreamModel(
          name: 'Stream $index', date: '31.08.2021', time: '19:20 - 19:50'),
    );

    // StreamsDB.setStreams(streams);

    // final streams = StreamsDB.getStreams();

    emit(state.copyWith(streams: streams));
  }

  Future<void> fetch() async {
    emit(state.copyWith(status: StreamStatus.loading));
    await Future.wait([
      loadingStreams(),
    ]);
    emit(state.copyWith(status: StreamStatus.ready));
  }
}
