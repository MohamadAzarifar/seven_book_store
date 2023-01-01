import 'package:book_store/components/components.dart';
import 'package:book_store/screens/screens.dart';
import 'package:flutter/material.dart';

class BookExplorerScreen extends StatelessWidget {
  const BookExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) => UIScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              _buildHorizontalList(context),
              _buildVerticalList(context),
            ],
          ),
        ),
      );

  Column _buildHorizontalList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Popular Books'),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildHorizontalListItem(context),
              _buildHorizontalListItem(context),
              _buildHorizontalListItem(context),
              _buildHorizontalListItem(context),
              _buildHorizontalListItem(context),
              _buildHorizontalListItem(context),
            ],
          ),
        )
      ],
    );
  }

  Column _buildVerticalList(BuildContext context) {
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
          itemCount: 400,
          itemBuilder: (_, __) => _buildVerticalListItem(context),
        ),
      ],
    );
  }

  Widget _buildHorizontalListItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const BookDetailScreen(
            bookId: 20,
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
            const Text('Book Name'),
            const Text('Auhor Name'),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalListItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const BookDetailScreen(
            bookId: 100,
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
              child: _buildBookDetails(),
            ),
          ],
        ),
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
