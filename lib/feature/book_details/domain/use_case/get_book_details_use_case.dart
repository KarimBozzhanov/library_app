import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/book_details/data/repository/book_details_repository.dart';
import 'package:library_app/feature/home/domain/entity/book_entity.dart';

class GetBookDetailsUseCase {
  GetBookDetailsUseCase() : _repository = sl();

  final BookDetailsRepository _repository;

  Future<BookEntity> getBook(String bookId) async {
    final bookDto = await _repository.getBook(bookId);
    return BookEntity.fromDto(bookDto);
  }
}