import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UIRatingBar extends StatelessWidget {
  const UIRatingBar({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) => RatingBar.builder(
        initialRating: rating,
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
      );
}
