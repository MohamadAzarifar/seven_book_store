import 'package:flutter/material.dart';

import 'package:book_store/components/components.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) => UIScaffold(
        body: Align(
          alignment: AlignmentDirectional.center,
          child: Column(
            children: [
              const SizedBox(height: 60),
              _buildBookImage(),
              _buildBookName(),
              _buildBookAuthor(),
            ],
          ),
        ),
      );

  Widget _buildBookImage() => Container(
        height: 300,
        width: 200,
        color: Colors.blue,
      );

  Widget _buildBookName() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Book Name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      );

  Widget _buildBookAuthor() => const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          'Book Author',
          style: TextStyle(
            color: Colors.grey,
            letterSpacing: 3,
          ),
        ),
      );
}
