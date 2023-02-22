import 'package:book_store/entity/book_entity.dart';
import 'package:book_store/screens/screens.dart';
import 'package:flutter/material.dart';

class BookHorizontalListItem extends StatelessWidget {
  const BookHorizontalListItem({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BookDetailScreen(
            book: book,
          );
        }));
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              width: 120,
              height: 150,
              child: Image.network(
                  'http://94.139.170.186:8081/api/v1/Image/GetImage?Url=5'),
            ),
            Text(book.title),
            Text(book.author),
          ],
        ),
      ),
    );
  }
}
