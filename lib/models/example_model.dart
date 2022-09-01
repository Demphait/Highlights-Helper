import 'dart:convert';

// Must be installed extention Dart Data Class Generator
class ExampleModel {
  final int id;
  final String title;

  ExampleModel({
    required this.id,
    required this.title,
  });

  ExampleModel copyWith({
    int? id,
    String? title,
  }) {
    return ExampleModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory ExampleModel.fromMap(Map<String, dynamic> map) {
    return ExampleModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExampleModel.fromJson(String source) => ExampleModel.fromMap(json.decode(source));

  @override
  String toString() => 'ExampleModel(id: $id, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExampleModel && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
