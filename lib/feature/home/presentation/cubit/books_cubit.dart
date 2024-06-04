import 'package:bloc/bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/domain/entity/book_entity.dart';
import 'package:library_app/feature/home/domain/use_case/get_books_use_case.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<CoreState> {
  BooksCubit()
      : _booksUseCase = sl(),
        super(BooksInitialState());

  final GetBooksUseCase _booksUseCase;
  List<BookEntity> _books = [];

  Future<void> getBooks() async {
    emit(BooksLoadingState());
    try {
      _books = await _booksUseCase.execute();
      if (_books.isEmpty) {
        emit(BooksEmptyState());
        return;
      }
      emit(
        BooksSuccessState(
          topBooks: getTopBooks(),
          latestBooks: getLatestBooks(),
          upcomingBooks: getUpcomingBooks(),
        ),
      );
    } catch (e) {
      emit(BooksFailureState());
    }
  }

  List<BookEntity> getTopBooks() {
    final newList = _books.where((book) => book.type == 0).toList();
    return newList;
  }

  List<BookEntity> getLatestBooks() {
    final newList = _books.where((book) => book.type == 1).toList();
    return newList;
  }

  List<BookEntity> getUpcomingBooks() {
    final newList = _books.where((book) => book.type == 2).toList();
    return newList;
  }
}
