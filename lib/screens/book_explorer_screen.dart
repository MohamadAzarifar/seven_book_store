import 'package:book_store/components/components.dart';
import 'package:book_store/datasource/api/book_apis.dart';
import 'package:book_store/entity/author_entity.dart';
import 'package:book_store/entity/book_entity.dart';
import 'package:book_store/entity/url_entity.dart';
import 'package:book_store/screens/screens.dart';
import 'package:flutter/material.dart';

class BookExplorerScreen extends StatelessWidget {
  const BookExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) => UIScaffold(
        body: FutureBuilder(
          future: BookApis().fetchBooks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final books = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    _buildHorizontalList(context, books),
                    _buildVerticalList(context, books),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );

  Column _buildHorizontalList(BuildContext context, List<BookEntity> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Popular Books'),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return _buildHorizontalListItem(context, books[index]);
              }),
        )
      ],
    );
  }

  Column _buildVerticalList(BuildContext context, List<BookEntity> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Newest',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: books.length,
          itemBuilder: (context, index) =>
              _buildVerticalListItem(context, books[index]),
        ),
      ],
    );
  }

  Widget _buildHorizontalListItem(BuildContext context, BookEntity book) {
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
            ),
            Text(book.title),
            Text(book.author),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalListItem(BuildContext context, BookEntity book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BookDetailScreen(
            book: book,
          );
        }));
      },
      child: SizedBox(
        height: 200,
        child: Row(
          children: [
            _buildBookImage(),
            const SizedBox(width: 8),
            Expanded(
              child: _buildBookDetails(book),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookDetails(BookEntity book) => Column(
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

  Widget _buildBookImage() => Container(
        color: Colors.blue,
        height: 150,
        width: 100,
      );
}
