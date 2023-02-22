import 'package:book_store/entity/book_entity.dart';
import 'package:book_store/screens/book_explorer/widgets/book_detail.dart';
import 'package:book_store/screens/book_explorer/widgets/book_image.dart';
import 'package:flutter/material.dart';

class BookVerticalListItem extends StatelessWidget {
  const BookVerticalListItem(
      {super.key, required this.book, required this.onTap});
  final BookEntity book;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        height: 200,
        child: Row(
          children: [
            BookImage(
              book: book,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: BookDetail(book: book),
            ),
          ],
        ),
      ),
    );
  }
}
