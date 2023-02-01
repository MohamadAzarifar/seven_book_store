import 'package:book_store/entity/book_entity.dart';
import 'package:dio/dio.dart';

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
}
