part of 'past_stream_cubit.dart';

enum PastStreamStatus { ready, loading }

class PastStreamState {
  final PastStreamStatus status;
  final List<HighlightModel> highlights;

  PastStreamState({
    this.status = PastStreamStatus.loading,
    this.highlights = const [],
  });

  PastStreamState copyWith({
    PastStreamStatus? status,
    List<HighlightModel>? highlights,
  }) {
    return PastStreamState(
      status: status ?? this.status,
      highlights: highlights ?? this.highlights,
    );
  }
}
