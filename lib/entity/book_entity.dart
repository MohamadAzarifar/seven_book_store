import 'dart:convert';

import 'package:book_store/entity/author_entity.dart';
import 'package:book_store/entity/url_entity.dart';

class BookEntity {
  final int id;
  final String title;
  final String description;
  final String author;
  final DateTime releaseDate;
  final String imagePath;
  final double rating;
  final String text;

  BookEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.releaseDate,
    required this.imagePath,
    required this.rating,
    required this.text,
  });

  factory BookEntity.fromMap(Map<String, dynamic> map) {
    return BookEntity(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['shortDescription'] ?? '',
      author: map['authorName'] ?? '',
      releaseDate: DateTime.parse(map['releaseDate']),
      imagePath: map['imageURL'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      text: map['text'] ?? '',
    );
  }

  factory BookEntity.fromJson(String source) =>
      BookEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookEntity(id: $id, title: $title, description: $description, author: $author, releaseDate: $releaseDate, imagePath: $imagePath, rating: $rating, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookEntity &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.author == author &&
        other.releaseDate == releaseDate &&
        other.imagePath == imagePath &&
        other.rating == rating &&
        other.text == text;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        author.hashCode ^
        releaseDate.hashCode ^
        imagePath.hashCode ^
        rating.hashCode ^
        text.hashCode;
  }
}
