import 'package:flutter/material.dart';

import 'package:book_store/components/components.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
              _buildRating(),
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

  Widget _buildRating() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar.builder(
            initialRating: 3.0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 15,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.orange,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: const [
              Text('3.5'),
              Text(
                ' / ',
                style: TextStyle(color: Colors.grey),
              ),
              Text('5.0', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      );
}
