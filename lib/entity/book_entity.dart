import 'dart:convert';

import 'package:book_store/entity/author_entity.dart';
import 'package:book_store/entity/url_entity.dart';

class BookEntity {
  final String name;
  final AuthorEntity author;
  final UrlEntity url;
  final double rating;

  BookEntity({
    required this.name,
    required this.author,
    required this.url,
    required this.rating,
  });

  BookEntity copyWith({
    String? name,
    AuthorEntity? author,
    UrlEntity? url,
    double? rating,
  }) {
    return BookEntity(
      name: name ?? this.name,
      author: author ?? this.author,
      url: url ?? this.url,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author.toMap(),
      'url': url.toMap(),
      'rating': rating,
    };
  }

  factory BookEntity.fromMap(Map<String, dynamic> map) {
    return BookEntity(
      name: map['name'] ?? '',
      author: AuthorEntity.fromMap(map['author']),
      url: UrlEntity.fromMap(map['url']),
      rating: map['rating']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookEntity.fromJson(String source) =>
      BookEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookEntity(name: $name, author: $author, url: $url, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookEntity &&
        other.name == name &&
        other.author == author &&
        other.url == url &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return name.hashCode ^ author.hashCode ^ url.hashCode ^ rating.hashCode;
  }
}
