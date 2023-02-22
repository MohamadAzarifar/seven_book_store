import 'package:book_store/components/components.dart';
import 'package:book_store/entity/book_entity.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(book.title),
            const Icon(
              Icons.bookmark_outline,
              color: Colors.black,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(book.author),
        ),
        UIRatingBar(
          rating: book.rating,
        ),
        const Spacer(),
      ],
    );
  }
}
