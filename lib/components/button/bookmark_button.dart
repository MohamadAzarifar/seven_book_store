import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          isBookmarked = !isBookmarked;
          setState(() {});
        },
        child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_outline));
  }
}
