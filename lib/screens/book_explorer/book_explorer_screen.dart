import 'package:book_store/components/components.dart';
import 'package:book_store/datasource/api/book_apis.dart';
import 'package:book_store/entity/book_entity.dart';
import 'package:book_store/screens/book_explorer/widgets/book_h_item.dart';
import 'package:book_store/screens/book_explorer/widgets/book_v_item.dart';
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
              itemBuilder: (context, index) =>
                  BookHorizontalListItem(book: books[index])),
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
            itemBuilder: (context, index) => BookVerticalListItem(
                  book: books[index],
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return BookDetailScreen(
                      book: books[index],
                    );
                  })),
                )),
      ],
    );
  }
}
