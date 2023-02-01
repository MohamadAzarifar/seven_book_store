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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      _buildBookImage(),
                      _buildBookName(book.title),
                      _buildBookAuthor(book.author),
                      _buildRating(book.rating),
                      _buildDescription()
                    ],
                  ),
                ),
              ),
              _buildButton(),
            ],
          ),
        ),
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

  Widget _buildDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Text(
            'Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})',
            style: TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }

//TODO: Make it one component
  Widget _buildBookImage() => Container(
        height: 300,
        width: 200,
        color: Colors.blue,
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
