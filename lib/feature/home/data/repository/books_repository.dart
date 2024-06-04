import 'package:library_app/common/data/network/cloud_firestore_api_service.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/data/dto/book_dto.dart';

class BooksRepository {
  BooksRepository() : _apiService = sl();

  final CloudFirestoreApiService _apiService;

  Future<List<BookDto>> getBooks() async {
    final documents = await _apiService.getBooks();
    return documents.map((book) => BookDto.fromJson(book.data())).toList();
  }
}
