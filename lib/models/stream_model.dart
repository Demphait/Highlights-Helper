import 'package:hive/hive.dart';
import 'package:single_house/models/highlight_model.dart';

part 'stream_model.g.dart';

@HiveType(typeId: 0)
class StreamModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final List<HighlightModel> highlights;

  StreamModel({
    required this.name,
    required this.date,
    required this.time,
    required this.highlights,
  });
}
