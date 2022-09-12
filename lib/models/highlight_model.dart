import 'package:hive/hive.dart';

part 'highlight_model.g.dart';

@HiveType(typeId: 1)
class HighlightModel extends HiveObject {
  @HiveField(0)
  final String time;
  @HiveField(1)
  final bool isAfk;

  HighlightModel({
    required this.time,
    required this.isAfk,
  });
}
