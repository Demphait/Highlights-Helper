part of 'stream_cubit.dart';

enum StreamStatus { ready, loading }

class StreamState {
  final StreamStatus status;
  final List<StreamModel> streams;

  StreamState({
    this.status = StreamStatus.loading,
    this.streams = const [],
  });

  StreamState copyWith({
    StreamStatus? status,
    List<StreamModel>? streams,
  }) {
    return StreamState(
      status: status ?? this.status,
      streams: streams ?? this.streams,
    );
  }
}
