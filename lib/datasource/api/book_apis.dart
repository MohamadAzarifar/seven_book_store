import 'package:book_store/entity/book_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BookApis {
  Future<List<BookEntity>> fetchBooks() async {
    try {
      var response = await Dio().get('http://94.139.170.186:8081/api/v1/Books');
      final result = response.data as Map<String, dynamic>;
      final data = result['data'] as List;
      final books = data.map((e) => BookEntity.fromMap(e)).toList();
      return books;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<BookEntity> fetchBookDetail(int bookId) async {
    try {
      var response =
          await Dio().get('http://94.139.170.186:8081/api/v1/Books/$bookId');
      final result = response.data as Map<String, dynamic>;
      if (result['isSuccess'] as bool == true) {
        final book = BookEntity.fromMap(result['data']);
        return book;
      } else {
        throw Exception(result['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  //http://94.139.170.186:8081/api/v1/Books/3
// http://94.139.170.186:8081/api/v1/Books
// http://94.139.170.186:8081/api/v1/Image/GetImage?Url=8
}
