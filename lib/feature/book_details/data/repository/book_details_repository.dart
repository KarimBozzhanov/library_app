import 'package:library_app/common/data/network/cloud_firestore_api_service.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/data/dto/book_dto.dart';

class BookDetailsRepository {
  BookDetailsRepository() : _apiService = sl();

  final CloudFirestoreApiService _apiService;

  Future<BookDto> getBook(String bookId) async {
    final book = await _apiService.getBook(bookId);
    return BookDto.fromSnapshot(book);
  }

  Future<void> book(String bookId, Map<String, dynamic> data) async {
    await _apiService.book(bookId, data);
  }
}