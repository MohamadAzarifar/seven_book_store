import 'package:book_store/components/components.dart';
import 'package:flutter/material.dart';

class BookExplorerScreen extends StatelessWidget {
  const BookExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) => UIScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Newest',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 400,
                      itemBuilder: (_, __) => _buildBookListItem())),
            ],
          ),
        ),
      );

  Widget _buildBookListItem() {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          _buildBookImage(),
          const SizedBox(width: 8),
          Expanded(
            child: _buildBookDetails(),
          ),
        ],
      ),
    );
  }

  Widget _buildBookDetails() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Fashionapolis'),
              Icon(
                Icons.bookmark_outline,
                color: Colors.black,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('Dana Thomas'),
          ),
          const UIRatingBar(),
          const Spacer(),
        ],
      );

  Widget _buildBookImage() => Container(
        color: Colors.blue,
        height: 150,
        width: 100,
      );
}