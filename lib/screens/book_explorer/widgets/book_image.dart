import 'package:book_store/entity/book_entity.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      child: Image.network(
          'http://94.139.170.186:8081/api/v1/Image/GetImage?Url=5'),
    );
  }
}
