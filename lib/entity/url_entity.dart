import 'dart:convert';

class UrlEntity {
  final String path;
  UrlEntity({
    required this.path,
  });

  UrlEntity copyWith({
    String? path,
  }) {
    return UrlEntity(
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
    };
  }

  factory UrlEntity.fromMap(Map<String, dynamic> map) {
    return UrlEntity(
      path: map['path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UrlEntity.fromJson(String source) =>
      UrlEntity.fromMap(json.decode(source));

  @override
  String toString() => 'UrlEntity(path: $path)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UrlEntity && other.path == path;
  }

  @override
  int get hashCode => path.hashCode;
}
