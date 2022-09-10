import 'package:bloc/bloc.dart';
import 'package:single_house/models/highlight_model.dart';

part 'past_stream_state.dart';

class PastStreamCubit extends Cubit<PastStreamState> {
  PastStreamCubit() : super(PastStreamState());

  Future<void> loadingHighlights() async {
    // await Future.delayed(const Duration(seconds: 5));
    List<HighlightModel> highlights = List.generate(
        20, (index) => HighlightModel(time: '04:15:10', isAfk: true));

    emit(state.copyWith(highlights: highlights));
  }

  Future<void> fetch() async {
    emit(state.copyWith(status: PastStreamStatus.loading));
    await Future.wait([
      loadingHighlights(),
    ]);
    emit(state.copyWith(status: PastStreamStatus.ready));
  }
}
