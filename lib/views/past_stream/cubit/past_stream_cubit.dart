import 'package:bloc/bloc.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/models/stream_model.dart';

part 'past_stream_state.dart';

class PastStreamCubit extends Cubit<PastStreamState> {
  PastStreamCubit() : super(PastStreamState());

  Future<void> loadingHighlights(StreamModel stream) async {
    emit(state.copyWith(highlights: stream.highlights));
  }

  Future<void> fetch(StreamModel stream) async {
    emit(state.copyWith(status: PastStreamStatus.loading));
    await Future.wait([
      loadingHighlights(stream),
    ]);
    emit(state.copyWith(status: PastStreamStatus.ready));
  }
}
