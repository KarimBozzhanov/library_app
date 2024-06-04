import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/data/repository/books_repository.dart';
import 'package:library_app/feature/home/domain/entity/book_entity.dart';

class GetBooksUseCase {
  GetBooksUseCase() :_repository = sl();

  final BooksRepository _repository;

  Future<List<BookEntity>> execute() async {
    final booksList = await _repository.getBooks();
    return BookEntity.fromDtoList(booksList);
  }
}
