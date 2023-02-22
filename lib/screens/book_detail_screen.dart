import 'package:book_store/datasource/api/book_apis.dart';
import 'package:book_store/entity/book_entity.dart';
import 'package:flutter/material.dart';

import 'package:book_store/components/components.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) => UIScaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          actions: const [
            BookmarkButton(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: FutureBuilder<BookEntity>(
            future: BookApis().fetchBookDetail(book.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final book = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 60),
                              _buildBookImage(book.id),
                              _buildBookName(book.title),
                              _buildBookAuthor(book.author),
                              _buildRating(book.rating),
                              _buildDescription(book.description)
                            ],
                          ),
                        ),
                      ),
                      _buildButton(),
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
            }),
      );

  Widget _buildButton() {
    return GestureDetector(
      onTap: () {
        print('Button clicked');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        child: const Center(
          child: Text(
            'Add to Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }

//TODO: Make it one component
  Widget _buildBookImage(int bookId) => Container(
        height: 300,
        width: 200,
        child: Image.network(
            'http://94.139.170.186:8081/api/v1/Image/GetImage?Url=5'),
      );

  Widget _buildBookName(String bookName) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          bookName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      );

  Widget _buildBookAuthor(String author) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          author,
          style: const TextStyle(
            color: Colors.grey,
            letterSpacing: 3,
          ),
        ),
      );

  Widget _buildRating(double rating) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIRatingBar(rating: rating),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Text(rating.toStringAsFixed(1)),
              const Text(
                ' / ',
                style: TextStyle(color: Colors.grey),
              ),
              const Text('5.0', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      );
}
